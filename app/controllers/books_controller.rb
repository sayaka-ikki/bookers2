class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @book.user_id = current_user.id
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if@book.save
      flash[:notice] = "You have created book successfully."
      redirect_to @book
    else
      @books = Book.all
      render :index
    end
  end

  def new
    @book = Book.new
  end

  def show
    @users = User.all
    @book = Book.new
    @book_id = Book.find(params[:id])
    @user = @book.user
    @books = Book.all
  end

  def edit
    @book_id = Book.find(params[:id])
  end

  def update
    @book_id = Book.find(params[:id])
    if @book_id.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    @book_id = Book.find(params[:id])
    @book_id.destroy
    redirect_to books_path
  end

end

private

def book_params
  params.require(:book).permit(:title, :body)
end