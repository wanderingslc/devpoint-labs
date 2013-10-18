class ContactController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      ContactMailer.contact_us(@message).deliver
      redirect_to root_path, notice: "Thanks for contacting us. We'll be in touch soon!"
    else
      flash.now.alert = "Please correct the errors below"
      render :new
    end
  end
end

