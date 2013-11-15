class AdminController < ApplicationController

  before_filter :authenticate_user!, :authorize_admin

  def index
  
  end


  private

  def authorize_admin
    redirect_to root_path, alert: "Sorry this area is restricted to admins." unless current_user.has_role? :admin
  end
end
