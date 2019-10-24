class DeleteIngredients < ActiveRecord::Migration[5.1]
    def change
        remove_column :sandwiches, :ingredients, :string
    end
end