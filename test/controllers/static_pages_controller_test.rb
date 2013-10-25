require "test_helper"

class StaticPagesControllerTest < ActionController::TestCase
  
  test "should get home" do
    get :home
    assert_response :success
    assert_template :home
  end

  test "should get web_development" do

    get :web_development
    assert_response :success
    assert_template :web_development
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_template :about
  end

  test "should get ios_development" do
    get :ios_development
    assert_response :success
    assert_template :ios_development
  end

  test "should get utah" do
    get :utah
    assert_response :success
    assert_template :utah
  end

  test "should get learn_more" do
    get :learn_more
    assert_response :success
    assert_template :learn_more
  end

  test "should get tuition" do
    get :tuition
    assert_response :success
    assert_template :tuition
  end

  test "should get faq" do
    get :faq
    assert_response :success
    assert_template :faq
  end

end
