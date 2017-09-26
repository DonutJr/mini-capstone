class CartedProductsController < ApplicationController


  def index
  @carted_products = CartedProduct.where(status: 'carted', user_id: current_user.id)  
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





end
