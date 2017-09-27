class OrdersController < ApplicationController

  def create
    carted_products = current_user.current_cart

    order = Order.create(user_id: current_user.id,)
    carted_products.update_all(status: "ordered", order_id: order.id)
    order.calculate_totals


    # CartedProduct.all.each do |carted_product|
    #   if carted_product.status == "carted"
    #     order = Or

    # order = Order.new(
    #               user_id: current_user.id,
    #               quantity: params[:quantity],
    #               product_id: params[:product_id],
    #               )

    # if order.save
    #   flash[:success] = "Order Successfully Purchased"
    #   # redirect_to '/orders/show'
      redirect_to "/orders/#{order.id}"
    end

  

  def show
    # @order = current_user.orders.last
    @order = Order.find(params[:id])
    unless current_user && current_user.id == @order.user_id
      redirect_to '/'
    end
  end



  
end
