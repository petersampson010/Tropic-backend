class PlantsController < ApplicationController

    def index 
        plants = Plant.all 
        render json: plants
    end 

    def create 
        Plant.create(plant_params)
    end 

    # def show 
    #     plant = Plant.find(params[:id])
    #     wishlist.destroy
    # end 

    private 

    def plant_params 
        params.require(:plant).permit!
    end 
end
