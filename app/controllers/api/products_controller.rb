class Api::ProductsController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all
    render "index.json.jb"

            # if params[:search]
            #   @products = @products.where("name iLike ?", "%#{params[:search]}%")
            # end

            # if params[:sort] == "price"
            #   if params[:sort_order] == "desc"
            #     @products = @products.order(:price :desc]
            #   else
            #     @products = @products.order(:price)
            #   end
            #   @products.order(:id)
            # end
    
            # if params[:discount]
            #   @products = @products.where("price < ?", 10)
            # end
            
            # @products.order(:id)
  end

  def show
    
    @product = Product.find_by(id: params[:id])
    # @image = Image.find_by(product_id: params[:id])
    render "show.json.jb"
    
  end

  def create

    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      quantity: params[:quantity],
      supplier_id: params[:supplier_id] 
    )
    @product.save
    ##Adding image table create URL
    # @image = Image.new(
    #   url: params[:url],
    #   product_id: @product.id
    # )
    if @product.save 
        render "show.json.jb"
    else 
      render json: {message: @product.errors.full_messages}, status: 422
    end
  end

  def update
    @product = Product.find(params[:id])
    # ###Added Image table -create update
    # @image = Image.find_by(product_id: params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.quantity= params[:quantity] || @product.quantity
    #add supplier_id
    @product.supplier_id= params[:supplier_id] || @product.supplier_id
    #create url update - image table
    @product.images.url = params[:url] || @product.images.url
    if @product.save 
      render "show.json.jb"
    else
      render json: {message: @product.errors.full_messages}, status: 422
    end
  end


  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Product successfully deleted"}
  end

end