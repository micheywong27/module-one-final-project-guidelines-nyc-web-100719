class AddColumnIngredients < ActiveRecord::Migration[5.1]

    def change 
        add_column :ingredients, :price, :integer 
    end

end