class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def formatted_subtotal
    "KSh #{(price * quantity).round(2)}"
  end
end
