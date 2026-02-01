require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    review = reviews(:one)
    assert review.valid?
  end

  test "should require rating" do
    review = Review.new(
      user: users(:one),
      product: products(:one),
      content: "This is a valid review content with enough characters."
    )
    assert_not review.valid?
    assert_includes review.errors[:rating], "can't be blank"
  end

  test "rating must be between 1 and 5" do
    review = reviews(:one)

    review.rating = 0
    assert_not review.valid?

    review.rating = 6
    assert_not review.valid?

    review.rating = 3
    assert review.valid?
  end

  test "should require content with minimum 10 characters" do
    review = Review.new(
      user: users(:one),
      product: products(:one),
      rating: 4,
      content: "Short"
    )
    assert_not review.valid?
    assert_includes review.errors[:content], "is too short (minimum is 10 characters)"
  end

  test "should prevent duplicate reviews from same user on same product" do
    existing_review = reviews(:one)
    duplicate_review = Review.new(
      user: existing_review.user,
      product: existing_review.product,
      rating: 3,
      content: "Another review for the same product by the same user."
    )
    assert_not duplicate_review.valid?
    assert_includes duplicate_review.errors[:user_id], "has already reviewed this product"
  end

  test "rating_label returns correct label" do
    review = reviews(:one)

    review.rating = 5
    assert_equal "Excellent", review.rating_label

    review.rating = 4
    assert_equal "Very Good", review.rating_label

    review.rating = 3
    assert_equal "Good", review.rating_label

    review.rating = 2
    assert_equal "Fair", review.rating_label

    review.rating = 1
    assert_equal "Poor", review.rating_label
  end

  test "mark_helpful! increments helpful_count" do
    review = reviews(:one)
    initial_count = review.helpful_count

    review.mark_helpful!
    review.reload

    assert_equal initial_count + 1, review.helpful_count
  end

  test "editable_by? returns true for review owner" do
    review = reviews(:one)
    assert review.editable_by?(review.user)
  end

  test "editable_by? returns false for non-owner" do
    review = reviews(:one)
    other_user = users(:two)
    assert_not review.editable_by?(other_user)
  end

  test "editable_by? returns false for nil user" do
    review = reviews(:one)
    assert_not review.editable_by?(nil)
  end
end
