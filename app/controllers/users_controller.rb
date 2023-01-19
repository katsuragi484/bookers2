class UsersController < ApplicationController
  def new
    @book = Book.new
  end



  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end

end
