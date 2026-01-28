class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  # Calculate total price of all items in cart
  def total_price
    cart_items.sum { |item| item.product.price * item.quantity }
  end

  # Format total price in KSH
  def formatted_total
    "KSh #{total_price.round(2)}"
  end

  # Count total items in cart
  def total_items
    cart_items.sum(:quantity)
  end
end
