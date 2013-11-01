class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    resource.pictures.new
    respond_with self.resource
  end


end