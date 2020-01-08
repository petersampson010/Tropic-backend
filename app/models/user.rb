class User < ApplicationRecord

    has_many :wishlists 
    has_many :growlists 
    has_many :plants, through: :growlists 
    has_many :plants, through: :wishlists 
end
