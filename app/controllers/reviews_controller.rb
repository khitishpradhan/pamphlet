class ReviewsController < ApplicationController
  def new
    @review = Review.new(review_params)

    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:review, :rating, :book_id, :user_id)
  end
end
