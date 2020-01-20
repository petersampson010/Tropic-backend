class WishlistsController < ApplicationController

    def index 
        wishlists = Wishlist.all 
        render json: wishlists 
    end 

    def create 
        wishlist = Wishlist.create(wishlist_params)
        render json: wishlist.plant
    end 

    def show 
        wishlist = Wishlist.find(params[:id])
        render json: wishlist
    end 

    def destroy
        wishlist = Wishlist.find(params[:id])
        wishlist.delete
    end 

    private 

    def wishlist_params 
        params.require(:wishlist).permit!
    end 
end
