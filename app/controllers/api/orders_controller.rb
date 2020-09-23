class Api::OrdersController < ApplicationController

  before_action :authenticate_user   ### method from Application Controller

  def index
      @orders = current_user.orders
      render "index.json.jb"
  end


  def create
    if current_user
      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity]
      )
      @order.subtotal = @order.quantity * @order.product.price
      @order.tax = @order.subtotal * 0.09.to_f
      @order.total = @order.subtotal + @order.tax
      if @order.save 
        
        render "show.json.jb"
      else 
        render json: {message: @order.errors.full_messages}, status: 422
      end
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    render "show.json.jb"
  end



end

