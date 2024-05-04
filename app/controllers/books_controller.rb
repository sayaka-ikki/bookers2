class BooksController < ApplicationController
  def index
    @users = User.all
    @user = User.new
    @books = Book.all
  end


  def create
    @book = current_user.books.build(book_params)
    if@book.save
      flash[:notice] = "You have created book successfully."
      redirect_to @book
    else
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
  params.require(:book).permit(:title, :opinion)
end