class ReviewsController < ApplicationController

  def show
    @city = City.find(params[:city_id])
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @city = City.create!(city_params)
    @review = @city.review.new(review_params)
    json_response(@city, :created)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: { message: "Review has been updated successfully."}
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy!
      render status: 200, json: { message: "Review has been deleted successfully."}
    end
  end

  private
  def review_params
    params.permit(:response)
  end

end
