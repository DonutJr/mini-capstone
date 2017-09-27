class ProductsController < ApplicationController
  # def one_product_action
  #   @product = Product.last
  #   render 'one_product_page.html.erb'
  # end

  # def all_products_action
  #   @products = Product.all
  #   render 'all_products_page.html.erb'
  # end
  before_action :authenticate_admin!, except: [:index, :show]


  def index



    @products = Product.all

    sort_attribute = params[:sort]
    desc = params[:desc]
    discount = params[:disc]
    random = params[:random]
    search = params[:search]
    movie = params[:movie]
    category_sort = params[:category_id]

    if sort_attribute
      @products = @products.order(sort_attribute)
    end

    if desc
      @products = @products.order(price: :desc)
    end

    if category_sort
      @products = Category.find_by(id: category_sort).products
    end

    if discount
      @products = @products.where("price < ?", discount)
    end

    if random
      @products = @products.order("RANDOM()").first(1)
    end

    if search
      @products = @products.where("#{:name} iLIKE ?" , "%#{search}%")
    end


  end

  def new
    # @product = Product.new
    @suppliers = Supplier.all
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
