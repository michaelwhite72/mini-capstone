class Api::CartedProductsController < ApplicationController

  before_action :authenticate_user

  def index
    @cartedproducts = current_user.carted_products.where(status: "carted")
    render "index.json.jb"
  end

  def create
    @cartedproduct = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    if @cartedproduct.save
      render "show.json.jb"
    else 
      render json: {message: @cartedproduct.errors.full_messages}, status: 422
    end

  end


 def destroy
   cartedproduct = current_user.carted_products.find(params[:id])
   cartedproduct.status = "removed"
   cartedproduct.save
   render json: { status: "product removed"}
 end



end
