class RegistrationsController < Devise::RegistrationsController

	# Enable registration through JSON
	respond_to :json

	# Disabling anti-csrf for create action, suggested by Devise devs for JSON API login
	# https://github.com/plataformatec/devise/issues/2432#issuecomment-18973236
	skip_before_filter :verify_authenticity_token, :only => :create
	
	def create
		build_resource(sign_up_params)

		if resource.save
			yield resource if block_given?
			if resource.active_for_authentication?
				sign_up(resource_name, resource)
				
				#####
				#This is the line that's been changed from the default Devise installation.
				#####
				render :json => {id: resource.id, name: resource.name, email: resource.email, authentication_token: resource.authentication_token }

			else
				set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
				expire_data_after_sign_in!
				respond_with resource, location: after_inactive_sign_up_path_for(resource)
			end
		else
			clean_up_passwords resource
			respond_with resource
		end

	end

end

# This is how create is currently defined by the Devise gem.
# We need to override to return a JSON response as specified by the instructions.

# POST /resource
#  def create
#    build_resource(sign_up_params)
#
#    if resource.save
#      yield resource if block_given?
#      if resource.active_for_authentication?
#        set_flash_message :notice, :signed_up if is_flashing_format?
#        sign_up(resource_name, resource)
#        respond_with resource, location: after_sign_up_path_for(resource)
#      else
#        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
#        expire_data_after_sign_in!
#        respond_with resource, location: after_inactive_sign_up_path_for(resource)
#      end
#    else
#      clean_up_passwords resource
#      respond_with resource
#    end
#  end
