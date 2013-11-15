class StaticPagesController < ApplicationController
  skip_authorization_check
  
  def home
    @users = User.includes(:picture, :tags, :projects)
  end

  def web_development
  end

  def about
  end

  def ios_development

  end

  def utah
    @ip_info = IpInfo.new().get_ip_info
  end

  def learn_more
  end

  def tuition
  end

  def faq
  end

end
