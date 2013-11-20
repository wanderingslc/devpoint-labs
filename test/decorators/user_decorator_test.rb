require 'test_helper'

class UserDecoratorTest < Draper::TestCase

  before do
    @user = UserDecorator.new(create(:user))
  end

  it 'displays full name properly as first + last name' do
    assert_equal @user.full_name, @user.first_name + ' ' + @user.last_name
  end

  it 'displays the street name properly' do
    @user.street_name.must_equal @user.first_name[0] + '-' + @user.last_name[0..4]
  end
end
