class Users::OmniauthCallbacksController < ApplicationController
	def facebook
		#raise request.env["omniauth.auth"].to_yaml
		@user = User.from_omniauth(request.env["omniauth.auth"])

		if @user.persisted?
			@user.remember_me = true
			sign_in_and_redirect @user, event: :authentication
		else
			session["devise.auth"] = request.env["omniauth.auth"]
			render :edit
		end
	end	

	def finish_sign_up
		@user = User.from_omniauth(session["devise.auth"])
		#@user.update(params[:user])
		#@user.update(user_params)
		if @user.update(user_params)
			sign_in_and_redirect @user, event: :authentication
		else
			render :edit
		end
	end

	def failure
		redirect_to new_user_session_path, 
		notice: "Error: #{params[:error_description]} - Razón: #{params[:error_reason]}"
		#render :failure
	end

	private

	def user_params
		#Parametros fuertes
		params.require(:user).permit(:name,:username,:email)		
		#params.require(:user).permit(:name,:username,:email,:provider,:uid)		
	end

end