class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }

  # Calculate subtotal for this item
  def subtotal
    product.price * quantity
  end

  # Format subtotal in KSH
  def formatted_subtotal
    "KSh #{subtotal.round(2)}"
  end
end
