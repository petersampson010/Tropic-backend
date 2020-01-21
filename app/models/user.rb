class User < ApplicationRecord

    has_many :wishlists 
    has_many :growlists

    def wishlist_plants
        self.wishlists.map{|w| w.plant}
    end
    
    def growlist_plants
        self.growlists.map{|w| w.plant}
    end

    def start_time 
        self.growlists.map{|w| w.start_time}
    end 

    has_secure_password
end
