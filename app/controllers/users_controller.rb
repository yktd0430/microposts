class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:succsess] = "Welcome to the Sample App!"
      redirect_to @user
    else
     render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:success] = "Profile successfully updated!" 
    else
      render 'edit'
    end
  end
    
  def followings
    @user = User.find(params[:id])
    @users = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :location, :introduction)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path if @user != current_user
  end
end