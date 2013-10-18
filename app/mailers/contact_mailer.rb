class ContactMailer < ActionMailer::Base
  layout 'email'

  def contact_us(message)
    @message = message
    mail(to: "support@devpointlabs.com", from: @message.email, subject: "[DevPoint Labs] #{@message.subject}" )
  end

end
