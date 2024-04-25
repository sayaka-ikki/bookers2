class BooksController < ApplicationController
  def index
    @users = User.all
    @user = User.new
    @books = Book.all
    @book = Book.new
  end


  def create
    @book = current_user.books.build(book_params)
    if@book.save
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
    @books = Book.all
  end

  def edit
  end
end

private

def book_params
  params.require(:book).permit(:title, :opinion)
end