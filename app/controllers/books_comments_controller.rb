class BooksCommentsController < ApplicationController
  def create
    book = Book.find(params[:id])
    books_comment = book.books_comments.new(books_comment_params)
    books_comment.book_id = book.id
    books_comment.save
    redirect_to book_path(book)      
  end

  def destroy
      
  end
  private
  def books_comment_params
    params.require(:books_comment).permit(:comment)
  end  
end
