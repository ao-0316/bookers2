class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.new
  end
  
  def show
    @book = Book.new
    
  end

  def edit
    
    @user = User.find(params[:id])
  end
  
  
  def update
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

end
