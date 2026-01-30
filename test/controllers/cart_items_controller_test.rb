require "test_helper"

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should create cart_item" do
    # First, get any page to initialize the cart session
    get products_url

    assert_difference("CartItem.count") do
      post cart_items_url, params: { product_id: @product.id }
    end

    assert_redirected_to cart_url
  end

  test "should update cart_item" do
    # First, create a cart item by visiting and adding to cart
    get products_url
    post cart_items_url, params: { product_id: @product.id }

    # Get the cart item that was just created
    cart_item = CartItem.last

    patch cart_item_url(cart_item), params: { quantity: 3 }
    assert_redirected_to cart_url
  end

  test "should destroy cart_item" do
    # First, create a cart item
    get products_url
    post cart_items_url, params: { product_id: @product.id }

    cart_item = CartItem.last

    assert_difference("CartItem.count", -1) do
      delete cart_item_url(cart_item)
    end

    assert_redirected_to cart_url
  end
end
