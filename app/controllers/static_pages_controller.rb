class StaticPagesController < ApplicationController
  
  def home
    @users = UserDecorator.decorate_collection(User.includes(:picture, :tags, :projects))
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
