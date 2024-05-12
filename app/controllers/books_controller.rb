class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
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
    @book = Book.new
    @book_id = Book.find(params[:id])
    @user = @book_id.user
    @books = Book.all
  end

  def edit
    @book_id = Book.find(params[:id])
    if @book_id.user != current_user
      redirect_to books_path
    end
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