class OrdersController < ApplicationController

  def create
    product = Product.find(params[:product_id])

    order = Order.new(
                  user_id: current_user.id,
                  quantity: params[:quantity],
                  product_id: params[:product_id],
                  )

    if order.save
      flash[:success] = "Order Successfully Purchased"
      # redirect_to '/orders/show'
      redirect_to "/orders/#{order.id}"
    end

  end

  def show

    # @order = current_user.orders.last
    @order = Order.find(params[:id])

  end



  
end
