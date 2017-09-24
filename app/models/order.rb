class Order < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user, optional: true

  has_many :carted_products
  has_many :products, through: :carted_products


  def initialize(options_hash)
    super(options_hash)
    calculate_totals
  end

  def calculate_subtotal
    self.subtotal = product.price * quantity
  end

  def calculate_tax
    self.tax = subtotal * 0.09
  end

  def calculate_total
    self.total = subtotal + tax 
  end

  def calculate_totals
    calculate_subtotal
    calculate_tax
    calculate_total
  end
end
