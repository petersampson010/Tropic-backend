class GrowlistsController < ApplicationController

    def index 
        growlists = Growlist.all 
        render json: growlists 
    end 

    def create 
        growlist = Growlist.create(growlist_params)
        render json: growlist
    end 

    def show 
        growlist = Growlist.find(params[:id])
        render json: growlist
    end 

    def destroy
        growlist = Growlist.find(params[:id])
        growlist.delete
    end 

    private 

    def growlist_params 
        params.require(:growlist).permit!
    end 
end
