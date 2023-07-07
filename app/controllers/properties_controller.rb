class PropertiesController < ApplicationController
  before_action :set_property, only: [:show,  :update, :destroy]
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /properties, & GET/seller_id/properties
  def index
    if params[:seller_id]
      properties = Seller.find(params[:seller_id]).properties
    else
      properties = Property.all
    end
    render json: properties
  end

  # GET /properties/1
  def show
    render json: @property
  end

  # POST /properties
  def create
    #user = User.find(session[:user_id])
    #if user.role.downcase = "seller"
      #seller_id = user.seller_id
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
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.permit(:title, :address, :price, :image, :bedrooms, :bathrooms, :seller_id)
    end

    def record_not_found
      render json: { error: 'Property not found' }, status: 404
    end
end
