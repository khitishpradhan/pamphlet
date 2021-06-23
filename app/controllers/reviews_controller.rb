class ReviewsController < ApplicationController
  def new
    @review = Review.new(review_params)

    @review.save

    redirect_to request.referrer
  end

  private

  def review_params
    params.require(:review).permit(:review, :rating, :book_id)
  end
end
