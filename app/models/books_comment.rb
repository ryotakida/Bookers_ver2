class BooksComment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :user
  belongs_to :book_image
end
