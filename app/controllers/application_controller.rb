class ApplicationController < ActionController::Base
  helper_method :current_user

  private
  
  def current_user
    @user = User.find_by_id(session[:user_id]) unless session[:user_id].nil?
  end
end
