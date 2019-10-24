require 'pry'

class Ingredient < ActiveRecord::Base
    #sandwich has many ingredients, ingredient has many sandwiches
    has_many :sandwich_ingredients
    has_many :sandwiches, through: :sandwich_ingredients
   
    
end