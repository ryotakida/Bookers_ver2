class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = PostImage.new(post_image_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(book)
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(book)
  end  

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def post_image_params
    params.require(:book).permit(:title, :body, :user_id)
  end  
end  
