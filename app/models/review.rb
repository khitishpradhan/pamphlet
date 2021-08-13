class Review < ApplicationRecord
  belongs_to :user

  def self.get_reviews_by_book(id)
    Review.includes(:user).where(book_id: id)
  end
end
