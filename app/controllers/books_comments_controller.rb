class BooksCommentsController < ApplicationController
  def create

    @book = Book.find(params[:book_id])
    @books_comment = @book.books_comments.build(books_comment_params)
    @books_comment.user_id = current_user.id
    @books_comment.book_id = @book.id
    @books_comment.save
    render "books/show"
  end

  def destroy
    BooksComment.find_by(id: params[:id]).destroy
    render "books/show"
  end
  private
  def books_comment_params
    params.require(:books_comment).permit(:comment)
  end  
end
