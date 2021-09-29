class AddBookIdToBooksComments < ActiveRecord::Migration[5.2]
  def change
    add_column :books_comments, :book_id, :integer
  end
end
