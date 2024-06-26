class UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @users = User.all
    @user = User.new
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  is_matching_login_user
  @user = User.find(params[:id])
  if  @user = current_user
     render :edit
  else    
    redirect_to user_path(current_user)
  end
  end

  def update
　is_matching_login_user
      @user = User.find(params[:id])
  if  @user.update(user_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to user_path(current_user)
  else
      render :edit
  end
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
