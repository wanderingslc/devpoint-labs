require "test_helper"

class ProjectsControllerTest < ActionController::TestCase

  before do
    @project = create(:project)
  end

  test "it displays all the projects on index page" do
    get :index
    assert_response :success
    assert_template :index
    # Testing presence of an instance variable
    assert_not_nil assigns(:projects)
  end

  test "it renders a new project form" do
    @project = build(:project)
    get :new
    assert_not_nil assigns(:project)
    assert_response :success
    assert_template :new
  end

  test "it creates a project and redirects to the project show page upon success" do
    assert_difference('Project.count', 1) do
      post :create, project: attributes_for(:project)
    end

    assert_response :redirect
    assert_not_nil flash.notice
    assert_redirected_to project_path(assigns(:project))
  end

  test "it doesn't create a project and renders the new action again upon failure" do
    assert_no_difference('Project.count') do
      post :create, project: attributes_for(:project, name: nil)
    end
    assert_response :success
    assert_template :new
    assert_not_nil flash.alert
  end

  test "it shows the project" do
    get :show, id: @project
    assert_response :success
    assert_template :show
    assert_not_nil assigns(:project)
  end

  test "it renders the edit form for the project" do
    get :edit, id: @project
    assert_not_nil assigns(:project)
    assert_response :success
    assert_template :edit
  end

  test "it updates the project and redirects to the project show page" do
    put :update, id: @project, project: @project.attributes.merge("name" => "New Name").except("id", "created_at", "updated_at")
    assert_response :redirect
    assert_redirected_to project_path(assigns(:project))
    assert_not_nil flash.notice
  end

  test "it doesn't update the project and re-renders the edit page" do
    put :update, id: @project, project: @project.attributes.merge("name" => nil).except("id", "created_at", "updated_at")
    assert_response :success
    assert_template :edit
    assert_not_nil flash.alert
  end

  test "it destroys the project on delete and redirects to the project index page" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end
    assert_response :redirect
    assert_redirected_to projects_path
    assert_not_nil flash.notice
  end

  test 'it displays a new gallery image page' do
    get :new_gallery_image
    assert_response :success
    assert_template :new_gallery_image
    
  end
end
