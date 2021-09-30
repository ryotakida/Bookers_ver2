class BooksCommentsController < ApplicationController
  def create

    @book = Book.find(params[:book_id])
    @books_comment = current_user.books_comments.new(books_comment_params)
    
    
    if @books_comment.save
      redirect_to book_path(@book)   
    else
      render "books/show"
    end  
  end

  def destroy
      
  end
  private
  def books_comment_params
    params.require(:books_comment).permit(:comment, :book_id, :user_id)
  end  
end
