class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # Validations
  validates :rating, presence: true, inclusion: { in: 1..5, message: "must be between 1 and 5" }
  validates :title, length: { maximum: 100 }, allow_blank: true
  validates :content, length: { minimum: 10, maximum: 1000 }, allow_blank: false
  validates :user_id, uniqueness: { scope: :product_id, message: "has already reviewed this product" }

  # Scopes
  scope :recent, -> { order(created_at: :desc) }
  scope :highest_rated, -> { order(rating: :desc) }
  scope :lowest_rated, -> { order(rating: :asc) }
  scope :most_helpful, -> { order(helpful_count: :desc) }
  scope :by_rating, ->(rating) { where(rating: rating) if rating.present? }

  # Instance methods
  def rating_label
    case rating
    when 5 then "Excellent"
    when 4 then "Very Good"
    when 3 then "Good"
    when 2 then "Fair"
    when 1 then "Poor"
    end
  end

  def formatted_date
    created_at.strftime("%B %d, %Y")
  end

  def mark_helpful!
    increment!(:helpful_count)
  end

  # Check if user can edit this review
  def editable_by?(user)
    return false unless user
    self.user_id == user.id
  end
end
