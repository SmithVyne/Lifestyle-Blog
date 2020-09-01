class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to articles_path
    else
      render :new, layout: 'forms'
    end
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id
      flash[:success] = ['You are sucessfully logged in']
      redirect_to articles_path
    else
      flash[:errors] = ['Wrong login']
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
