class RegistrationsController < Devise::RegistrationsController
  
  def new
    @twitter = session["devise.twitter_data"]
    build_resource({})
    resource.build_picture
    respond_with self.resource
  end

  def create
    build_resource(sign_up_params)
    resource.build_picture
    @twitter = session["devise.twitter_data"]
    resource.setup_twitter_user(@twitter)
    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

end