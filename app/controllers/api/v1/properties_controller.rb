module Api::V1
  class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :update, :destroy]
    # before_action :authenticate_user, except: %i[index show]
    respond_to :json
  
    def index
      @properties ||= Property.all
      render json: @properties, status: :ok
    end

    def show
      render json: @property, status: :ok
    end
  
    def new
      @property = Property.new(property_params)
    end
  
    def create
      @property = Property.new(property_params)
      if @property.save
        render json: @property, status: :created
      else
        render json: @property.errors, status: :unprocessable_entity
      end
    end

    def update
      if @property.update(property_params)
        render json: @property
      else
        render json: @property.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @property.destroy
      render json: { "message": "Property deleted successfully" }, status: :ok
    end
  
    private

    def set_property
      @property ||= Property.find(params[:id])
    end
  
    def property_params
      params.require(:property).permit(:user_id, :property_type, :name, :location, :price, :price_per_sqfoot, :size, {:rent_sale => []}, :description, {:image_urls => []}, :beds, :baths)
    end
  end
end
