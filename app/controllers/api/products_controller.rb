class Api::ProductsController < ApplicationController


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
    @image = Image.find_by(product_id: params[:id])
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      #image_path: params[:image_path],
      description: params[:description],
      quantity: params[:quantity],
      supplier_id: params[:supplier_id] 
    )
    ##Adding image table create URL
    @image = Image.new(
      url: params[:url],
      product_id: 10
    )

    if @product.save && @image.save
        render "show.json.jb"
    else 
      render json: {message: @product.errors.full_messages}, status: 422
    end
  end

  def update
    @product = Product.find(params[:id])
    ###Added Image table -create update
    @image = Image.find_by(product_id: params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.quantity= params[:quantity] || @product.quantity
    #add supplier_id
    @product.supplier_id= params[:supplier_id] || @product.supplier_id
    #create url update - image table
    @image.url = params[:url] || @image.url
    if @product.save && @image.save
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