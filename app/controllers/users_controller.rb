class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name])

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = ['Sucessfully Signed Up']
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
