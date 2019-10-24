require 'pry'

class UserSandwich < ActiveRecord::Base
    belongs_to :user 
    belongs_to :sandwich

    def favorite_user_sandiwch
      
    end
    
end
