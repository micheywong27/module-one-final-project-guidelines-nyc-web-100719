class CreateSandwich < ActiveRecord::Migration[5.1]

    def change 
        create_table :sandwiches do |t|
            t.string :name
        end
    end

end