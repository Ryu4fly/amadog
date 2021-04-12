class ReviewsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
    authorize @review
  end

  def create

    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    authorize @review
    @user = User.find(params[:user_id])
    @review.user = @user
    @review.reviewer = current_user
    @review.save

    redirect_to user_path(@user)
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
