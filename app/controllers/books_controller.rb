class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
  @book = Book.new(book_params)
  if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to books_path
  else
    flash[:alert] = @book.errors.full_messages.join(", ")
    @books = Book.all
    render :index
  end
  end

  def new
  end

  def show
  end

  def edit
  end
end
