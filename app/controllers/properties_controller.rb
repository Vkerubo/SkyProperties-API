class PropertiesController < ApplicationController
  before_action :set_property, only: [:show,  :update, :destroy]

  # GET /properties
  def index
    if params[:seller_id]
      properties = Seller.find(params[:seller_id]).properties
    else
      properties = Property.all
    end
    render json: @property, include: [:buyers]
  end

  # GET /properties/1
  def show
    render json: @property
  end

  # POST /properties
  def create
    property = Property.create!(property_params)

    if property
      render json: property, status: :created
    else
      render json: property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:title, :address, :price, :image, :bedrooms, :bathrooms, :seller_id)
    end
end
