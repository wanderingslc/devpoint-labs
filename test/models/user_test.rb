require "test_helper"

# class UserTest < ActiveSupport::TestCase

#   def setup
#     @user = build(:user)
#   end  

#   def tests_that_first_name_is_absent_on_creation
#     @user.first_name = nil
#     assert @user.invalid?, 'User did not have a first name'
#   end  

#   def test_that_last_name_is_required_on_creation
#     @user.last_name = nil
#     assert @user.invalid?, "User did not have a last name"
#   end    
# end


class UserTest < ActiveSupport::TestCase

  before do 
    @user = build(:user)
  end

  test "ensures that an error is raised if user is created without a first name" do
    @user.first_name = nil
    refute @user.valid?, 'User did not have a first name'
  end  

  test "ensures that an error is raised if user is created without a last name" do
    @user.last_name = nil
    refute @user.valid?, "User did not have a last name"
  end    
end


# describe User do

#   let(:user) { build(:user)}

#   it "ensures that an error is raised if created without a first name" do
#     user.first_name = nil
#     refute user.valid?, 'User did not have a first name'
#   end  

#   it "ensures that an error is raised if created without a last name" do
#     user.last_name = nil
#     refute @user.valid?, "User did not have a last name"
#   end    
# end
