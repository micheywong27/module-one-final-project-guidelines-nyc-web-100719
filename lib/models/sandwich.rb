require 'pry'

class Sandwich < ActiveRecord::Base
    has_many :user_sandwiches
    has_many :sandwich_ingredients
    has_many :ingredients, through: :sandwich_ingredients
    has_many :users, through: :user_sandwiches

    def sandwich(name)
        puts name + ":" + ingredients
    end
    
    def all_ingredients
        # return array of strings containing every ingredient in THIS sandwich
        self.ingredients.map do |ingredient|
          ingredient.name
        end
    end
end