class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :address, presence: true

  def formatted_total
    "KSh #{total_price.round(2)}"
  end
end
