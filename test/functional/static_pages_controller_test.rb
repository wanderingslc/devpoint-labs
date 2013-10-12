require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get web_development" do
    get :web_development
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get ios_development" do
    get :ios_development
    assert_response :success
  end

  test "should get utah" do
    get :utah
    assert_response :success
  end

  test "should get learn_more" do
    get :learn_more
    assert_response :success
  end

  test "should get tuition" do
    get :tuition
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

end
