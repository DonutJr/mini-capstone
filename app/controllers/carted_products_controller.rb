class CartedProductsController < ApplicationController
  before_action :authenticate_user!


  def index
    # @carted_products = CartedProduct.where(status: 'carted', user_id: current_user.id)  
    if current_user && current_user.current_cart.any?
      @carted_products = current_user.current_cart
    else
      flash[:warning] = "You have no items in your cart, why don't you find something you like"
      redirect_to '/'
    end
  end

  def create

    carted_product = CartedProduct.new(
                                      user_id: current_user.id,
                                      product_id: params[:product_id],
                                      quantity: params[:quantity],
                                      status: "carted"
                                      )
    carted_product.save

    # flash[:success] = "Successfully Added to Cart"
    redirect_to "/cart"


  end


  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status: "removed")
    flash[:success] = "product Removed"
    redirect_to "/cart"
  end


end
