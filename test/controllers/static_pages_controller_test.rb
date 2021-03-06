require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get privacy" do
    get :privacy
    assert_response :success
  end

  test "should get terms_of_use" do
    get :terms_of_use
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

  test "should get copyright" do
    get :copyright
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

end
