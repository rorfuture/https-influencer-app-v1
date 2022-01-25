require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get indeex" do
    get pages_indeex_url
    assert_response :success
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get tc" do
    get pages_tc_url
    assert_response :success
  end

  test "should get privacy" do
    get pages_privacy_url
    assert_response :success
  end
end
