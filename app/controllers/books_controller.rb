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
    @user = @book.user
    @books = Book.all
  end

  def edit
  end

  def destroy
    book_id = Book.find(params[:id])
    book_id.destroy
    redirect_to 'books'
  end

end

private

def book_params
  params.require(:book).permit(:title, :opinion)
end