class Plant < ApplicationRecord

    has_many :wishlists 
    has_many :growlists 
    has_many :users, through: :growlists 
    has_many :users, through: :wishlists 
end
