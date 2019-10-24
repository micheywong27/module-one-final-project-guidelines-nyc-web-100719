class AddPrices < ActiveRecord::Migration[5.1]
    def change
        add_column :sandwiches, :prices, :integer
    end
end