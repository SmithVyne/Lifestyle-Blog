class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    if current_user
      redirect_to articles_path
    else
      render :new, layout: 'forms'
    end
  end

  def create
    @user = User.find_by(session_params)
    if @user
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      flash[:errors] = ['Wrong login, user does not exist']
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private
  
  def session_params
    params.permit(:name)
  end
end
