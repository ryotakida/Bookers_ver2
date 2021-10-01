class BooksCommentsController < ApplicationController
  def create

    @book = Book.find(params[:book_id])
    @books_comment = BooksComment.new(books_comment_params)
    @books_comment.user_id = current_user.id
    @books_comment.book_id = @book.id
    
    if @books_comment.save
      redirect_to book_path(params[:book_id])   
    else
     render "books/show"
    end   
  end

  def destroy
    BooksComment.find_by(id: params[:id]).destroy
    redirect_to book_path(params[:book_id]) 
  end
  private
  def books_comment_params
    params.require(:books_comment).permit(:comment)
  end  
end
