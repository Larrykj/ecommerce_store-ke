require "application_system_test_case"

class ApplicationSystemTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit root_url
    assert_selector "h1", minimum: 0
  end
end
