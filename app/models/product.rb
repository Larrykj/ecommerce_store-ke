class Product < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  # Check if product is in stock
  def in_stock?
    quantity > 0
  end

  # Format price for display in KSH
  def formatted_price
    "KSh #{price.round(2)}"
  end
end
