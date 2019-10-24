Ingredient.delete_all
SandwichIngredient.delete_all
Sandwich.delete_all
UserSandwich.delete_all
User.delete_all

chicken_club = Sandwich.create(:name=>"Chicken Club", :prices=>9)
grilled_cheese = Sandwich.create(:name=>"Grilled Cheese", :prices=>6)
italian_sandwich = Sandwich.create(:name=>"Italian Sandwich", :prices=>10)


michelle = User.create(:name=>"Michelle")
bobby_flay = User.create(:name=>"Bobby Flay")
chef_boyardee = User.create(:name=>"Chef Boyardee")

lettuce = Ingredient.create(:name=>"Lettuce", :price=>1)
tomato = Ingredient.create(:name=>"Tomato", :price=>1)
bacon = Ingredient.create(:name=>"Bacon", :price=>1)
chicken = Ingredient.create(:name=>"Chicken", :price=>1)
mayo = Ingredient.create(:name=>"Mayo", :price=>1)
wrap = Ingredient.create(:name=>"Wrap", :price=>3)
whole_wheat_bread = Ingredient.create(:name=>"Whole Wheat Bread", :price=>3)
multi_grain_bread = Ingredient.create(:name=>"Multi-Grain Bread", :price=>3)
white_bread = Ingredient.create(:name=>"White Bread", :price=>3)
roll = Ingredient.create(:name=>"Roll", :price=>3)
hero = Ingredient.create(:name=>"Hero", :price=>3)
mozz_cheese = Ingredient.create(:name=>"Mozz Cheese", :price=>1)
salami = Ingredient.create(:name=>"Salami", :price=>1)
ham = Ingredient.create(:name=>"Ham", :price=>1)
pepperoni = Ingredient.create(:name=>"Pepperoni", :price=>1)
avocado = Ingredient.create(:name=>"Avocado", :price=>1)

SandwichIngredient.create(:sandwich_id=>chicken_club.id, :ingredient_id=>lettuce.id)
SandwichIngredient.create(:sandwich_id=>chicken_club.id, :ingredient_id=>tomato.id)
SandwichIngredient.create(:sandwich_id=>chicken_club.id, :ingredient_id=>chicken.id)
SandwichIngredient.create(:sandwich_id=>chicken_club.id, :ingredient_id=>mayo.id)
SandwichIngredient.create(:sandwich_id=>chicken_club.id, :ingredient_id=>roll.id)

SandwichIngredient.create(:sandwich_id=>grilled_cheese.id, :ingredient_id=>mozz_cheese.id)
SandwichIngredient.create(:sandwich_id=>grilled_cheese.id, :ingredient_id=>white_bread.id)

SandwichIngredient.create(:sandwich_id=>italian_sandwich.id, :ingredient_id=>tomato.id)
SandwichIngredient.create(:sandwich_id=>italian_sandwich.id, :ingredient_id=>lettuce.id)
SandwichIngredient.create(:sandwich_id=>italian_sandwich.id, :ingredient_id=>mayo.id)
SandwichIngredient.create(:sandwich_id=>italian_sandwich.id, :ingredient_id=>hero.id)
SandwichIngredient.create(:sandwich_id=>italian_sandwich.id, :ingredient_id=>salami.id)
SandwichIngredient.create(:sandwich_id=>italian_sandwich.id, :ingredient_id=>ham.id)
SandwichIngredient.create(:sandwich_id=>italian_sandwich.id, :ingredient_id=>pepperoni.id)