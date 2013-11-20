require "test_helper"

class AdminControllerTest < ActionController::TestCase
  
  before do
    @user = UserDecorator.find(create(:user))
    @user.add_role :admin
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should deny access if user does is not signed in" do
    sign_out @user
    get :index
    assert_response :redirect
    assert_redirected_to new_user_session_path
    assert_not_nil flash.alert
  end

  test "should deny access if user does not have admin role" do
    @user.remove_role :admin
    get :index
    assert_response :redirect
    assert_redirected_to root_url
    assert_not_nil flash.alert
  end  
end
