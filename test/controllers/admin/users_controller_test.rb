require "test_helper"

class Admin::UsersControllerTest < ActionController::TestCase

  before do
    @user = UserDecorator.find(create(:user))
    @user.add_role :admin
    sign_in @user
  end

  test "it displays all the users on the admin index page" do
    get :index
    assert_response :success
    assert_template :index
    # Testing presence of an instance variable
    assert_not_nil assigns(:users)
  end

  test "it renders a new user form" do
    get :new
    assert_not_nil assigns(:user)
    assert_response :success
    assert_template :new
  end

  test "it creates a user and redirects to the admin user show page upon success" do
    assert_difference('User.count', 1) do
      post :create, user: attributes_for(:user)
    end

    assert_response :redirect
    assert_not_nil flash.notice
    assert_redirected_to admin_user_path(assigns(:user))
  end

  test "it doesn't create a user and renders the new action again upon failure" do
    assert_no_difference('User.count') do
      post :create, user: attributes_for(:user, first_name: nil)
    end
    assert_response :success
    assert_template :new
    assert_not_nil flash.alert
  end

  test "it shows the user" do
    get :show, id: @user
    assert_response :success
    assert_template :show
    assert_not_nil assigns(:user)
  end

  test "it renders the edit form for the user" do
    get :edit, id: @user
    assert_not_nil assigns(:user)
    assert_response :success
    assert_template :edit
  end

  test "it updates the user and redirects to the user show page" do
    put :update, id: @user, user: @user.attributes.merge("name" => "New Name").slice(*User.accessible_attributes)
    assert_response :redirect
    assert_redirected_to admin_user_path(assigns(:user))
    assert_not_nil flash.notice
  end

  test "it doesn't update the user and re-renders the edit page" do
    put :update, id: @user, user: @user.attributes.merge("first_name" => nil).slice(*User.accessible_attributes)
    assert_response :success
    assert_template :edit
    assert_not_nil flash.alert
  end

  test "it destroys the user on delete and redirects to the user index page" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end
    assert_response :redirect
    assert_redirected_to admin_users_path
    assert_not_nil flash.notice
  end

end
