class FavoritesController < ApplicationController

  wrap_parameters format: []
  # GET /favorites
  def index
    favorites = Favorite.all
    render json: favorites

  rescue_from ActiveRecord::RecordNotFound,  with: :render_not_found
  wrap_parameters format: []
  # GET /favorites
  def index 
   user = User.find_by(id: session[:user_id])
   buyer = Buyer.find_by(id: user&.buyer_id)
   favorites = Favorite.where(buyer_id: buyer&.id)
   if favorites.present?
    render json: favorites
    else
     render json: {error: "Favorites not found"}
    end
  end

  def show
    favorite = Favorite.find(params[:id])
    render json: favorite, status: :ok

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

    favorite.destroy
    head :no_content
  end

  private 

  def render_not_found
    render json: {error: "Favorite not Found"}, status: 404

  end
  
end
