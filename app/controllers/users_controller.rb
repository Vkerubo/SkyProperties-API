class UsersController < ApplicationController
  before_action :set_user, only: %i[ update destroy ]
  skip_before_action :authorize, only: 
  wrap_parameters format: []
  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    user = User.find_by(id: session[:user_id])
    if user
        render json: user
    else
        render json:{error: "Not authorized"}, status: :unauthorized
    end
end

  # POST /users

  def create
    user = User.create(user_params)
    name = user.username
  
    if user.valid?
      if user.role.downcase == 'buyer'
        buyer = Buyer.find_by(email: user.email)
        unless buyer
          buyer = Buyer.create(name: name, email: user.email, phone: user.phone)
        end
        session[:user_id] = user.id
        render json: buyer, status: :created
      elsif user.role.downcase == 'seller'
        seller = Seller.find_by(email: user.email)
        unless seller
          seller = Seller.create(name: name, email: user.email, phone: user.phone)
        end
        session[:user_id] = user.id
        render json: seller, status: :created
      else
        render json: { error: 'Invalid role' }, status: :unprocessable_entity
      end
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
  
  

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :phone, :password, :role)
    end
end

