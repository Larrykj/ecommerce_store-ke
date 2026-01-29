class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :address, presence: true
  validates :phone, presence: true

  # Updated enum syntax for Rails 7+
  enum :status, { pending: "pending", processing: "processing", shipped: "shipped", delivered: "delivered", cancelled: "cancelled" }, default: :pending

  def total_price
    order_items.sum { |item| item.price * item.quantity }
  end

  def formatted_total
    "KSh #{total_price.round(2)}"
  end
end
