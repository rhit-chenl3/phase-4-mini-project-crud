class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :handle_error

    def index
        spices = Spice.all
        render json: spices
    end

    # def show
    #     spice = Spice.find(params[:id])
    #     render json: spice
    # end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def handle_error
        render json: { errors: "Spice not found" }, status: :unprocessable_entity 
    end

end
