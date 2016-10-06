class ReviewsController < ApplicationController
  before_action :find_review, only: [:update, :edit]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      # @review.update(user_id: , event_id:)
      redirect_to root_path
    else
      render 'new'
    end
  end

  end

  def edit
  end

  def update
  end

  private

  def review_params   
    params.require(:review).permit(:score, :comment, :event_title)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
