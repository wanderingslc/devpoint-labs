require "test_helper"

describe User do

  let(:user) {build(:user)}

  describe "it passes all the validation" do
    it "it has an email" do
      user.email = nil
      refute user.valid?, 'User did not have a first name'
    end

    it "it has a valid email" do
      user.email = 'ben@be'
      assert user.invalid?, 'User did not have a first name'
    end  

    it "it has a password" do
      user.password = nil
      assert user.invalid?, 'User did not have a first name'
    end    

    it "password length is less than 120 characters" do
      user.password = ('a' * 121).to_s
      assert user.invalid?, 'User did not have a first name'
    end   

    it "password length is no less  than 6 characters" do
      user.password = '12345'
      assert user.invalid?, 'User did not have a first name'
    end   

    it "ensures that an error is raised if user is created without a first name" do
      user.first_name = nil
      refute user.valid?, 'User did not have a first name'
    end  

    it "ensures that an error is raised if user is created without a last name" do
      user.last_name = nil
      refute user.valid?, "User did not have a last name"
    end    
  end

  it 'displays full name properly as first + last name' do
    assert_equal user.full_name, user.first_name + ' ' + user.last_name
  end

  it 'displays the street name properly' do
    user.street_name.must_equal user.first_name[0] + '-' + user.last_name[0..4]
  end
end


# describe User do

#   let(:user) { build(:user)}

#   it "can't be created without a first name" do
#     user.first_name = nil
#     user.valid?.must_equal false, 'User did not have a first name'
#   end  

#   it "can't be created without a last name" do
#     user.last_name = nil
#     refute @user.valid?, "User did not have a last name"
#   end    
# end


# class UserTest < ActiveSupport::TestCase

# def setup
#   @user = build(:user)
# end  

#   def tests_that_first_name_is_absent_on_creation
#     @user.first_name = nil
#     assert @user.invalid?, 'User did not have a first name'
#   end  

#   def test_that_last_name_is_required_on_creation
#     @user.last_name = nil
#     assert @user.invalid?, "User did not have a last name"
#   end    
# end

