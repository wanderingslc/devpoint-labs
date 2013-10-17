class UserMailer < ActionMailer::Base
  default from: "noreply@devpointlabs.com"

  layout 'email'
  # Call email using: UserMailer.welcome(user).deliver
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to DevPoint Labs!")
  end

  
end
