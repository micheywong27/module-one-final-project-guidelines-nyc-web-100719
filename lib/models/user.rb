require 'pry'

class User < ActiveRecord::Base
    has_many :user_sandwiches
    has_many :sandwiches, through: :user_sandwiches

    # def user_login(name)
    #     puts "Hello, welcome to sandwich maker! Please enter a username: "
    #     if !User.find_by(name)
    #         name = User.create(name)
    #     else 
    #         name = User.find_by(name)
    #     end
    # end

    # def request_password(password)
    #     if !User.find_by(name)
    #         puts "Enter a new password for your account!"

    #     else

    #     end
        
    # end

    # def choose_sandwich(sandwich)
    #     puts "Select a sandwich: "
    #     Sandwich.all.map do |sandwich|
    #         sandwich.name
    #     end
    # end

    # def choose_drink(drink)

    # end

    # def order_count
    # # return the number of songs in a genre
    #     self.user_sandwiches.count
    # end

    # def total_for_order
    #     self.sandwiches.map do |sandwich|
    #         sandwich.price
    #     end
    # end
end