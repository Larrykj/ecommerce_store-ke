require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @product = products(:one)
    @review = reviews(:two) # Use review two since it's by user two
  end

  test "should create review when signed in" do
    sign_in @user

    # User one doesn't have a review on product two yet
    product_two = products(:two)

    assert_difference("Review.count") do
      post product_reviews_url(product_two), params: {
        review: {
          rating: 5,
          title: "Great product",
          content: "This is an amazing product that I highly recommend to everyone!"
        }
      }
    end

    assert_redirected_to product_url(product_two)
  end

  test "should not create review when not signed in" do
    product_two = products(:two)

    assert_no_difference("Review.count") do
      post product_reviews_url(product_two), params: {
        review: {
          rating: 5,
          title: "Great product",
          content: "This is an amazing product that I highly recommend!"
        }
      }
    end

    assert_redirected_to new_user_session_url
  end

  test "should get edit for own review" do
    sign_in users(:two)

    get edit_product_review_url(@review.product, @review)
    assert_response :success
  end


  test "should not get edit for another user's review" do
    sign_in @user

    get edit_product_review_url(@review.product, @review)
    assert_redirected_to product_url(@review.product)
  end

  test "should update own review" do
    sign_in users(:two)

    patch product_review_url(@review.product, @review), params: {
      review: {
        rating: 3,
        content: "Updated review content with more than ten characters."
      }
    }

    assert_redirected_to product_url(@review.product)
    @review.reload
    assert_equal 3, @review.rating
  end

  test "should destroy own review" do
    sign_in users(:two)

    assert_difference("Review.count", -1) do
      delete product_review_url(@review.product, @review)
    end

    assert_redirected_to product_url(@review.product)
  end

  test "should not destroy another user's review" do
    sign_in @user

    assert_no_difference("Review.count") do
      delete product_review_url(@review.product, @review)
    end

    assert_redirected_to product_url(@review.product)
  end

  test "should mark review as helpful" do
    sign_in @user
    initial_count = @review.helpful_count

    post helpful_product_review_url(@review.product, @review)

    @review.reload
    assert_equal initial_count + 1, @review.helpful_count
  end
end
