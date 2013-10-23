require "test_helper"

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = build(:message)
  end

  def test_valid
    assert @message.valid?
    assert_match Devise::email_regexp, @message.email
  end

  test "rejects a message without a body" do
    @message = build(:message, body: nil)
    assert @message.invalid?
  end

  test "rejects a message without a subject" do
    @message = build(:message, subject: nil)
    assert @message.invalid?
  end
  
  test "rejects a message without a name" do
    @message = build(:message, name: nil)
    assert @message.invalid?
  end  

  test "rejects a message without a email" do
    @message = build(:message, email: nil)
    assert @message.invalid?, "Doesn't have an email"
  end

  test "checks that email has a valid format" do
    @message = build(:message, email: 'invalid@example,com')
    assert @message.invalid?, "email format was not invalid"
    refute_match Devise::email_regexp, @message.email
  end


end



# describe Message do
#   let(:message) { Message.new }

#   it "must be valid" do
#     message.must_be :valid?
#   end
# end


## These tests cover all our presence validations
# [:name, :body, :subject, :email].each do |attribute_name|
#   test "rejects a message without a #{attribute_name}" do
#     @message = build(:message, "#{attribute_name}" => nil)
#     assert @message.invalid?, "Didn't have an #{attribute_name}"
#   end
# end