class FavoritesController < ApplicationController
  wrap_parameters format: []
  # GET /favorites
  def index
    favorites = Favorite.all
    render json: favorites
  end

  # POST /favorites
  def create
    user = User.find_by(id: session[:user_id])
    property = Property.find(params[:id])
    favorite = Favorite.create(buyer_id: user.buyer_id, property_id: property.id)
    if favorite.valid?
      render json: favorite, status: :created
    else
      render json: {error: "Favorite not added"}, status: :unprocessable_entity
    end
  end

  # DELETE /favorites/1
  def destroy
    favorite = Favorite.find(params[:id])
    if favorite
      favorite.destroy
      head :no_content
    else
      render json: {error: "Favorite not found"}, status: 404
    end
  end
  
end
