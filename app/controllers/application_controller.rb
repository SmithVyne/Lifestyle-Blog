class ApplicationController < ActionController::Base

  private
  
  def current_user
    @user = User.find_by_id(session[:user_id]) unless session[:user_id].nil?
  end
end
