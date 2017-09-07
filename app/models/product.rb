class Product < ApplicationRecord
  def sale_message
    "Discount item!" if price < 2
    "Everyday value!" if price > 2
  end

  def tax
    0.09 * price
  end

  def total
    price + tax
  end

end
