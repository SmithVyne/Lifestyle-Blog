class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:id])
    if @user
      session[:user_id] = @user.id
      flash[:success] = ['You are sucessfully logged in']
      redirect_to @user
    else
      flash[:errors] = ['Wrong login']
      redirect_to login_path
    end
  end
end
