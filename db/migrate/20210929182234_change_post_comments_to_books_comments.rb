class ChangePostCommentsToBooksComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :post_comments, :books_comments 
  end
end
