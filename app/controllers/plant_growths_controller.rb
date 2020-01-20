class PlantGrowthsController < ApplicationController

    def index 
        plant_growths = PlantGrowth.all 
        render json: plant_growths
    end 

    def show 
        plant_growth = PlantGrowth.find(params[:id])
        render json: plant_growth
    end 

    def create 
        plant_growth = PlantGrowth.create(plant_growth_params)
    end 

    private 

    def plant_growth_params 
        params.require(:plant_growth).permit(
            :name, 
            :germinate_s, 
            :germinate_f, 
            :sprouting_s, 
            :sprouting_f, 
            :harvest_s, 
            :harvest_f, 
            :maturity_s, 
            :maturity_f,
            :pot_s, 
            :pot_f,
            :protect_s,
            :protect_f,
            :flowering_s,
            :flowering_f,
            :fruiting_s,
            :fruiting_f,
            :fertilize_s,
            :fertilize_f,
            :bloom_s,
            :bloom_f,
            :outside_s,
            :outside_f)
    end 
end
