require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  before do 
    @message = build(:message)
    @email = ContactMailer.contact_us(@message).deliver
  end

  # it 'shows email layout' do
  #   assert_template layout: 'layouts/email'
  # end

  it "is delivered to support@devpointlabs.com" do
    assert_equal @email.to.pop, "support@devpointlabs.com"
  end

  it "is delivered from the senders email" do
    assert_equal @email.from.pop, @message.email
  end

  it "is delivered with an appropriate subject" do
    assert_equal @email.subject, "[DevPoint Labs] #{@message.subject}"
  end

end