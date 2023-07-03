class BuyersController < ApplicationController
  before_action :set_buyer, only: %i[ show update destroy ]

  # GET /buyers
  def index
    @buyers = Buyer.all

    render json: @buyers
  end

  # GET /buyers/1
  def show
    render json: @buyer
  end

  # POST /buyers
  def create
    @buyer = Buyer.new(buyer_params)

    if @buyer.save
      render json: @buyer, status: :created, location: @buyer
    else
      render json: @buyer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /buyers/1
  def update
    if @buyer.update(buyer_params)
      render json: @buyer
    else
      render json: @buyer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /buyers/1
  def destroy
    @buyer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buyer_params
      params.require(:buyer).permit(:name, :email, :phone)
    end
end
