require "tty-prompt"
require 'pry'


class FoodApp 
    def run
        prompt
        greeting
        login
    end

    @@cart = []
    @@new_built_sandwich_ingredients = []
    
    def prompt
    prompt = TTY::Prompt.new
    end

    def greeting
        puts "Hello, welcome to sandwich maker!".blue.bold
    end

    def login
        username_input = prompt.ask('Enter a username: ', default: ENV['USER'])
        if !User.find_by(name: username_input)
            created_password = prompt.mask("Create a password: ")
            @@user = User.create(:name => username_input, :password => created_password)
            puts "* You successfully created your username & password *"
            choose_sandwich_option
        else 
            #figure out how to not accept a wrong password when you log in
            @@user = User.find_by(name: username_input)
            password_input = prompt.mask("Enter your password: ")
            #require password_input == password
            show_past_orders
        end
        
    end

    def show_past_orders
        puts "* Welcome back! *"
        answer = prompt.yes?('Would you like to view your past orders?'.italic.red)  do |q|
            q.validate(/Y|N/, 'choose the "Y" or "N" key to answer')
          end
        if answer == true
           puts "Your past orders:"
           previous_sandys = @@user.sandwiches.map do |sandwich|
                                sandwich.name
                end
            puts previous_sandys
           answer = prompt.yes?('Do you want to select an order from before?'.italic.red) do |q|
            q.validate(/Y|N/, 'choose the "Y" or "N" key to answer')
                end
                if answer == true
                    choices = previous_sandys
                    order_they_want = prompt.select('Which order do you want?',choices)
                     @@cart << "#{order_they_want} - $#{Sandwich.find_by(name: order_they_want).prices}"
                    review_cart
                else 
                    puts "*" * 80
                    choose_sandwich_option
                end
        else 
            puts `clear`
            choose_sandwich_option
        end
    end


    def choose_sandwich_option
        choices = ["Select a premade sandy", "Build your own!"]
        choice = prompt.select("Would you like to:".blue, choices)
        case choice
        when choices[0]
            select_sandwich
        when choices[1]
            build_your_own
        end
    end

    def build_your_own
        choices = Ingredient.all.map do |ingredient|
            "#{ingredient.name} - $#{ingredient.price}"
        end
        selections = prompt.multi_select("What ingredients do you want in your sandwich?".red, choices)
        @@cart << selections
        @@new_built_sandwich_ingredients = selections
        
        choices = ["Continue", "<-- Go Back"]
        choice = prompt.select("Do you want to continue?", (choices))
            case choice
            when choices[0]
                create_new_sandwich_type
            when choices[1]
            choose_sandwich_option
            end
    end

    def select_sandwich
        choices = Sandwich.all.map do |sandwich|
                "#{sandwich.name} - $#{sandwich.prices}"
                end
        selections = prompt.multi_select("What kind of sandwich do you want?".red, choices)
        @@cart << selections 

        choices = ["Continue", "<-- Go Back"]
        choice = prompt.select("Do you want to continue?", (choices))
            case choice
            when choices[0]
                select_drink
            when choices[1]
                choose_sandwich_option
            end
    end
 
    def create_new_sandwich_type
       ingredient_price =@@new_built_sandwich_ingredients.map do |ingredient|
            ingredient.split("$")[1].to_i
        end
       total_price = ingredient_price.inject(:+)
       sandy_name = prompt.ask('Name your sandwich!'.red, default: ENV['USER'])
       new_sandy = Sandwich.create(:name=>sandy_name, :prices=>total_price)
       UserSandwich.create(:user_id => @@user.id, :sandwich_id => new_sandy.id)
       select_drink
    end

    def select_drink
        choices = ["Coke - $2", "Pepsi - $2", "Tea - $1", "Water - $1", "Lemonade - $2", "None"]
        user_choice =prompt.multi_select("Select any drinks you would like:".red, choices)
        @@cart << user_choice
        if user_choice.include?("None")
            @@cart.flatten!.delete("None")
            review_cart
        else 
           choice = prompt.select('What size?'.blue) do |menu|
                menu.choice 'Small', 1
                menu.choice 'Medium', 2, disabled: '(out of stock)'
                menu.choice 'Large', 3
                menu.choice '<-- Go Back', 4
                end  
            if choice == 4
                select_drink
            else
                puts `clear`
                review_cart
            end
        end

    end

    def review_cart
        puts "*" * 80
        puts "Your cart:".bold.blue 
        puts @@cart
        puts "*" * 20
        total_cost
    end
    
    def total_cost
       prices = @@cart.flatten.map do |ingredient|
            ingredient.split("$")[1].to_i
         end
         total_prices = prices.inject(:+)
         puts "Your total: $#{total_prices}".bold.blue
         select_more_options
     end

     def select_more_options
        answer = prompt.yes?('Do you want to add anything else or edit your order?'.italic.red)  do |q|
            q.validate(/Y|N/, 'choose the "Y" or "N" key to answer')
          end
        if answer == true
            choices = ["Add item", "Delete item"]
            choice = prompt.select("Would you like to add more items or delete any items?", choices)
                case choice
                when choices[0]
                    add_to_order
                when choices[1]
                    delete_item
                end
        else 
            rating
        end
     end

     def add_to_order
     choose_sandwich_option
    end

    def delete_item
        choices = @@cart.flatten
        item_to_delete = prompt.multi_select("Which item would you like to delete?".red, choices)
        updated_cart = choices.filter{|item|!item_to_delete.include?(item)}
        @@cart = updated_cart
        review_cart
    end

    def rating
        puts "*" * 80
        user_rating = prompt.ask("How was your meal on a scale from 1-9?".bold.blue) { |q| q.in('1-9') }
        if user_rating.to_i <5
            puts("Sorry to hear that, please let us know how we can improve!")
        else 
            puts("Thanks for your feedback. Enjoy your meal!")
        end
    end

end

