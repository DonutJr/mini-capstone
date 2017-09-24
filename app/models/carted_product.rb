class CartedProduct < ApplicationRecord

  belongs_to :user, :product, :order
end
