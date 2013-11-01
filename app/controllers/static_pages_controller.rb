class StaticPagesController < ApplicationController

  def home
    @users = User.includes(:pictures, :tags, :projects)
  end

  def web_development
  end

  def about
  end

  def ios_development
  end

  def utah
  end

  def learn_more
  end

  def tuition
  end

  def faq
  end

end
