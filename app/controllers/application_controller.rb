class ApplicationController < ActionController::Base
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
end
