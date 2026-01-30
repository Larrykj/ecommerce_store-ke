require "test_helper"

# CategoriesControllerTest - Integration tests for the Categories controller
# 
# This test class verifies the CRUD operations for categories, including:
# - Public access to index and show actions
# - Protected access to create, edit, update, and destroy (requires authentication)
#
# Author: Larrykj
# Last Updated: 2026-01-30
class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @category = categories(:one)
    @user = users(:one)
  end

  # Test: Verify categories index page is publicly accessible
  test "should get index" do
    get categories_url
    assert_response :success
  end

  # Test: Verify individual category page is publicly accessible
  test "should get show" do
    get category_url(@category)
    assert_response :success
  end

  # Test: Verify new category form requires authentication
  test "should get new when signed in" do
    sign_in @user
    get new_category_url
    assert_response :success
  end

  # Test: Verify unauthenticated users are redirected to login
  test "should redirect new when not signed in" do
    get new_category_url
    assert_redirected_to new_user_session_url
  end

  # Test: Verify category creation with valid params when authenticated
  test "should create category when signed in" do
    sign_in @user
    assert_difference("Category.count") do
      post categories_url, params: { category: { name: "New Category", description: "A new test category" } }
    end

    assert_redirected_to categories_url
  end

  # Test: Verify edit form is accessible when authenticated
  test "should get edit when signed in" do
    sign_in @user
    get edit_category_url(@category)
    assert_response :success
  end

  # Test: Verify category update with valid params
  test "should update category when signed in" do
    sign_in @user
    patch category_url(@category), params: { category: { name: "Updated Name", description: "Updated description" } }
    assert_redirected_to category_url(@category)
  end

  # Test: Verify category deletion when authenticated
  test "should destroy category when signed in" do
    sign_in @user
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
