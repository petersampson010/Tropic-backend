class User < ApplicationRecord

    has_many :wishlists 
    has_many :growlists 
    # has_many :plants, through: :growlists 
    # has_many :plants, through: :wishlists 

    def wishlist_plants
        self.wishlists.map{|w| w.plant}
    end
    
    def growlist_plants
        self.growlists.map{|w| w.plant}
    end

    has_secure_password
end
