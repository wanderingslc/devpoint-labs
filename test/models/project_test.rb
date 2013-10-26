require "test_helper"

class ProjectTest < ActiveSupport::TestCase

  before do
    @project = build(:project)
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
    @project.user_id = nil
    assert @project.invalid?
  end    


end
