  class ReviewsController < ApplicationController

    def new
      @superpower = Superpower.find(params[:superpower_id])
      @review = Review.new
    end


    def create
      @review = Review.new(review_params)
      @superpower = Superpower.find(params[:superpower_id])
      @review.superpower = @superpower
      if @review.save
        redirect_to superpower_path(@superpower)
      else
        render new
      end
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to superpowers_path(@Reviews)
    end

    private

    def review_params
      params.require(:review).permit(:content)
    end
  end
