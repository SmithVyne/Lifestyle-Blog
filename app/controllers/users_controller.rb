class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    @user = User.new
    render :new, layout: 'forms'
  end

  def create
    @user = User.new(name: params[:name])

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = ['Sucessfully Signed Up']
      redirect_to articles_path
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end
end
