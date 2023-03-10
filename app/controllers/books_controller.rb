class BooksController < ApplicationController
before_action :baria_user, only: [:edit, :destroy]

  def edit
    @book = Book.find(params[:id])

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new


    @books = Book.all
    @user = current_user
    # @bookuser = @book.user

  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    # @user = current_user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end

  private

  def baria_user
    @book = Book.find(params[:id])
    @user = @book.user
    if @user != current_user
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
