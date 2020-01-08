class GrowlistsController < ApplicationController

    def index 
        growlists = Growlist.all 
        render json: growlists 
    end 
end
