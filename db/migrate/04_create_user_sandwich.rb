class CreateUserSandwich < ActiveRecord::Migration[5.1]

    def change 
        create_table :user_sandwiches do |t|
            t.integer :user_id 
            t.integer :sandwich_id 
        end
    end

end