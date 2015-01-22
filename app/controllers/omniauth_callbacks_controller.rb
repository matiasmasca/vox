class OmniauthCallbacksController < ApplicationController
  def provider
  	user = User.process_omniauth(request.env["omniauth.auth"])
	if user.persisted?
		flash.notice = "Usuario indentificado correctamente. Bienvenido!"
		sign_in_and_redirect user
	else
		session["devise.user_attributes"] = user.attributes
		redirect_to new_user_registration_url
    end
  end

  alias_method :twitter, :provider
  alias_method :facebook, :provider
end
