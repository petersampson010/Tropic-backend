class UserSerializer < ActiveModel::Serializer

    attributes :id, :username, :wishlist_plants, :growlist_plants

end 