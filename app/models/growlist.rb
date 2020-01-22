class Growlist < ApplicationRecord

    belongs_to :user 
    belongs_to :plant 

    def plant 
        self.plant 
    end 
end
