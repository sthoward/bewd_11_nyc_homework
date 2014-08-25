class RegistrationsController < Devise::RegistrationsController
 
 def create
 	super
 	session[:omniauth] = nil unless @user.new_record?
 end


 private
 
  def build_resource(*args)
  	super
  	if session[:omniauth]
  		@user.apply_omniauth(session[:omniauth])
  		@user.valid?
  	end
  end

  def sign_up_params
    params.require(:user).permit(:username, :email, :birth_date, :first_name, :last_name, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:username, :email, :birth_date, :first_name, :last_name, :password, :password_confirmation, :current_password)
  end
end
