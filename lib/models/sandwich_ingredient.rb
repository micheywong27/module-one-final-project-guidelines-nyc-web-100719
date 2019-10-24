require 'pry'

class SandwichIngredient < ActiveRecord::Base
    #sandwich has many ingredients, ingredient has many sandwiches
   belongs_to :sandwich
   belongs_to :ingredient
   
end