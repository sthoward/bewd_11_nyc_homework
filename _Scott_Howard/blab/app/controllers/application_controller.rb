class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_player?

  ##### http://www.bignerdranch.com/blog/lazy-user-registration-for-rails-apps/
  

  # def authenticate_user!(*args)
  #   current_user.present? || super(*args)
  # end
 
  # def current_user
  #   super || AnonymousUser.find_or_initialize_by_token(anonymous_user_token).tap do |user|
  #     user.save(validate: false) if user.new_record?
  #   end
  # end
 
  # private
  # def anonymous_user_token
  #   session[:user_token] ||= SecureRandom.hex(8)
  # end


  def current_player?
    flag = false
    @playersessions.each do |session|
      if current_user == session.user then 
        flag = true
      end
    end
    return flag
  end

end
