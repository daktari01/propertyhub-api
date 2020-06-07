class PropertiesController < ApplicationController
  respond_to :json

  def index
    @properties = Property.all
  end

  def def new
    @property = Property.new(property_params)

    if @property.save?
      
    end
  end

  def show

  end

  private

  def property_params
    params.require(:property).permit(:user_id, :name, :location, :price, :rent_sale, :description, :image_urls)
  end
end
