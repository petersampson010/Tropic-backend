class GrowlistsController < ApplicationController

    def index 
        growlists = Growlist.all 
        render json: growlists 
    end 

    def create 
        growlist = Growlist.create(growlist_params)
        render json: growlist.plant
    end 

    def show 
        wishlist = Wishlist.find(params[:id])
        wishlist.destroy
    end 

    private 

    def growlist_params 
        params.require(:growlist).permit!
    end 
end
