class ReviewsController < ApplicationController
  def new
    @review = Review.new

    render plain: @review
  end

  def index
    @reviews = Review.all

    render plain: @reviews
  end
end
