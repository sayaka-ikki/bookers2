class BooksController < ApplicationController
  def index
    @users = User.all
    @books = Book.all
  end


  def create
    @book = current_user.books.build(book_params)
    if@book.save
        flash[:notice] = "You have created book successfully."
      redirect_to books_path
    else
      render :index
    end
  end

  def new
    @book = Book.new
  end

  def show
  end

  def edit
  end
end

private

def book_params
  params.require(:book).permit(:title, :opinion)
end