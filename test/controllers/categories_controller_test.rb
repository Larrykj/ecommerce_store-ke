require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @category = categories(:one)
    @user = users(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get show" do
    get category_url(@category)
    assert_response :success
  end

  test "should get new when signed in" do
    sign_in @user
    get new_category_url
    assert_response :success
  end

  test "should redirect new when not signed in" do
    get new_category_url
    assert_redirected_to new_user_session_url
  end

  test "should create category when signed in" do
    sign_in @user
    assert_difference("Category.count") do
      post categories_url, params: { category: { name: "New Category", description: "A new test category" } }
    end

    assert_redirected_to categories_url
  end

  test "should get edit when signed in" do
    sign_in @user
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category when signed in" do
    sign_in @user
    patch category_url(@category), params: { category: { name: "Updated Name", description: "Updated description" } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category when signed in" do
    sign_in @user
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
