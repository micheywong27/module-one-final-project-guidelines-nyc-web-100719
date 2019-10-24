class CreateSandwichIngredient < ActiveRecord::Migration[5.1]

    def change 
        create_table :sandwich_ingredients do |t|
            t.integer :sandwich_id 
            t.integer :ingredient_id
        end
    end

end