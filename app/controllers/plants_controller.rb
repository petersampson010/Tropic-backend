class PlantsController < ApplicationController

    def index 
        plants = Plant.all 
        render json: plants
    end 

    def create 
        Plant.create(plant_params)
    end 

    private 

    def plant_params 
        params.require(:plant).permit!
    end 
end
