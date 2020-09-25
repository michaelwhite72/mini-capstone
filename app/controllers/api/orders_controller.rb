class Api::OrdersController < ApplicationController

  before_action :authenticate_user   ### method from Application Controller

  def index
      @orders = current_user.orders
      render "index.json.jb"
  end


  def create
    # @order = Order.new(
    #   user_id: current_user.id,
    #   product_id: params[:product_id],
    #   quantity: params[:quantity]
    # )
    # @order.subtotal = @order.quantity * @order.product.price
    # @order.tax = @order.subtotal * 0.09.to_f
    # @order.total = @order.subtotal + @order.tax

    cartedproducts = current_user.carted_products.where(status: "carted")
    calculated_subtotal= 0
    cartedproducts.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )

    if @order.save 
      #updated carted product status and order_id
      cartedproducts.update_all(status: "purchased", order_id: @order.id)
      render "show.json.jb"
    else 
      render json: {message: @order.errors.full_messages}, status: 422
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    render "show.json.jb"
  end



end

