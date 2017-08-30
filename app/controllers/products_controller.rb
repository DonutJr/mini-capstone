class ProductsController < ApplicationController
  def one_product_action
    @product = Product.last
    render 'one_product_page.html.erb'
  end

  def all_products_action
    @products = Product.all
    render 'all_products_page.html.erb'
  end

end
