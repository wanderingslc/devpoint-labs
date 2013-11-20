require "test_helper"

class PostsControllerTest < ActionController::TestCase

  before do
    @post = create(:post)
  end

  test "it displays all the posts on index page" do
    get :index
    assert_response :success
    assert_template :index
    # Testing presence of an instance variable
    assert_not_nil assigns(:posts)
  end

  test "it renders a new post form" do
    @post = build(:post)
    get :new
    assert_not_nil assigns(:post)
    assert_response :success
    assert_template :new
  end
 
 test "it creates a post and redirects to the post show page upon success" do
    assert_difference('Post.count', 1) do
      post :create, post: attributes_for(:post)
    end

    assert_response :redirect
    assert_not_nil flash.notice
    assert_redirected_to post_path(assigns(:post))
  end

  test "it doesn't create a post and renders the new action again upon failure" do
    assert_no_difference('Post.count') do
      post :create, post: attributes_for(:post, title: nil)
    end
    assert_response :success
    assert_template :new
    assert_not_nil flash.alert
  end

  test "it shows the post" do
    get :show, id: @post
    assert_response :success
    assert_template :show
    assert_not_nil assigns(:post)
  end

  test "it renders the edit form for the post" do
    get :edit, id: @post
    assert_not_nil assigns(:post)
    assert_response :success
    assert_template :edit
  end

  test "it updates the post and redirects to the post show page" do
    put :update, id: @post, post: @post.attributes.slice(*Post.accessible_attributes).merge("title" => "New Title")
    assert_response :redirect
    assert_redirected_to post_path(assigns(:post))
    assert_not_nil flash.notice
  end

  test "it doesn't update the post and re-renders the edit page" do
    put :update, id: @post, post: @post.attributes.merge("title" => nil).slice(*Post.accessible_attributes)
    assert_response :success
    assert_template :edit
    assert_not_nil flash.alert
  end

  test "it destroys the post on delete and redirects to the post index page" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_response :redirect
    assert_redirected_to posts_path
    assert_not_nil flash.notice
  end
end
