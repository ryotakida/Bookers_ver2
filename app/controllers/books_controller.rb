class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      render :index
    end  
  end
  
  def edit
    @book = Book.find(params[:id])
    if current_user == @book.user
      render :edit
    else
      redirect_to books_path
    end  
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end  
  end  

  def index
    @books = Book.all
    @book = Book.new
    @user = @book.user
    @books_comments = BooksComment.all
    to  = Time.current.at_end_of_day
    from  = (to - 6.day).at_beginning_of_day    
    @books = Book.includes(:favorite_users).sort {|a,b|
    b.favorite_users.includes(:favorites).where(created_at: from...to).size <=> a.favorite_users.includes(:favorites).where(created_at: from...to).size}

  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new 
    @user = @book.user
    @books_comment = BooksComment.new
    @books_comments = BooksComment.all
    
    
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end  
end  
