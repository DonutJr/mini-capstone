class ProductsController < ApplicationController
  # def one_product_action
  #   @product = Product.last
  #   render 'one_product_page.html.erb'
  # end

  # def all_products_action
  #   @products = Product.all
  #   render 'all_products_page.html.erb'
  # end

  def index
    @products = Product.all
  end

  def new
    # @product = Product.new
  end

  def create
    product = Product.new(
                          name: params[:name],
                          price: params[:price],
                          image: params[:image],
                          description: params[:description]
                          )
      product.save
      flash[:success] = "Lego Successfully Created"
      redirect_to "/products/#{product.id}"
  end

  def show
    product_id = params[:id]
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])

    product.assign_attributes(
                              name: params[:name],
                              price: params[:price],
                              image: params[:image],
                              description: params[:description]
                              )

    product.name = params[:name]
    product.price = params[:price]
    product.image = params[:image]
    product.description = params[:description]

    product.save
    flash[:success] = "Lego Successfully Updated"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:danger] = "Lego Successfully Destroyed"
    redirect_to "/products/"
  end

end
