class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to @user
     else
       render 'edit'
     end
   end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
