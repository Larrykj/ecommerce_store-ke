require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get show" do
    get product_url(@product)
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: {
        product: {
          name: "New Test Product",
          description: "This is a test product with a description that is long enough",
          price: 29.99,
          quantity: 10,
          category_id: categories(:one).id
        }
      }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: {
      product: {
        name: "Updated Product",
        description: "Updated description that is long enough for validation",
        price: 39.99,
        quantity: 20
      }
    }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    # Create a standalone product without any cart_items referencing it
    product_to_delete = Product.create!(
      name: "Product To Delete",
      description: "This product will be deleted in the test",
      price: 10.00,
      quantity: 5,
      category: categories(:one)
    )

    assert_difference("Product.count", -1) do
      delete product_url(product_to_delete)
    end

    assert_redirected_to products_url
  end
end
