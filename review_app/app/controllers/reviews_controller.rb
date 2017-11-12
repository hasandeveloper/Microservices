class ReviewsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def create
		@review = Review.new(review_params)
		if @review.save
			render json: @review
		else
			render json: {errors: @review.errors.full_messages}
		end
	end

	def update
		@review = Review.find(params[:id])
		if @review.update_attributes(review_params)
			render json: @review
		else
			render json: {errors: @review.errors.full_messages}
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		render json: {notice: "Successfully deleted the review"}
	end

	private

	def review_params
		params[:review].permit(:title, :body, :rating, :product_id)
	end
end
