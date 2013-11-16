require "test_helper"

class ProjectTest < ActiveSupport::TestCase

  before do
    @user = create(:user)
    @project = @user.projects.create(attributes_for(:project))
  end

  it 'cannot be created without a user' do
    proj = build(:project)
    assert proj.invalid?
  end

  it 'is a valid project' do
    assert @project.valid?
  end

  it 'has a name' do
    @project.name = nil
    assert @project.invalid?
  end

  it 'has a description' do
    @project.description = nil
    assert @project.invalid?
  end  

  it 'has a user id' do
    @project.user = nil
    assert @project.invalid?
  end    


end
