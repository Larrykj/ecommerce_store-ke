require "test_helper"

# CartsControllerTest - Integration tests for the Carts controller
#
# This test class verifies cart display functionality.
# The cart uses a singular resource (resource :cart) so there's only show action.
#
# Author: Larrykj
# Last Updated: 2026-01-30
class CartsControllerTest < ActionDispatch::IntegrationTest
  # Test: Verify cart page is accessible
  # Uses singular resource URL (cart_url, not carts_url)
  test "should get show" do
    get cart_url
    assert_response :success
  end
end
