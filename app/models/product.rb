class Product < ApplicationRecord
  
  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
  # end

  belongs_to :supplier

  has_many :image

  def sale_message

    if discounted?
      "Discount Item!"
    else
      "Everyday Great Value!"
    end
    # "Discount item!" if price < 50
    # "Everyday value!" if price > 50
  end

  def tax
    0.09 * price
  end

  def total
    price + tax
  end

  def discounted?
   price < 50

  end

end
