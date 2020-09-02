class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user, :truncate

  private

  def current_user
    @user = User.find_by_id(session[:user_id]) unless session[:user_id].nil?
  end

  def truncate(text, num=nil)
    if num
      text[0, num] + '....'
    else
      text[0, 50] + '....'
    end
  end

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end
