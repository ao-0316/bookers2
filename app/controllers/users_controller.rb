class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.new
  
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end
  
  
  def update
      is_matching_login_user
      @user = User.find(params[:id])
  if  @user.update(user_params)
      redirect_to user_path(@user.id) 
      flash[:notice] = "You have updated book successfully."
      redirect_to user_path(@user)
  else
      render :edit
    end
  end  


  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
  
  def is_matching_login_user
    user_id = Book.find(params[:id]).user_id
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to users_path
    end
  end

end
