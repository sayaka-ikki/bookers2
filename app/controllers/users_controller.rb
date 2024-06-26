class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @book.user_id = current_user.id
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to current_user
    end
  end

  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
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
