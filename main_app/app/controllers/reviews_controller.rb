class ReviewsController < ApplicationController

	def index
		@reviews = HTTParty.get("http://localhost:3003/api/v1/reviews")
	end

	def show
		@review = HTTParty.get("http://localhost:3003/api/v1/reviews/#{params[:id]}")
		@product = HTTParty.get("http://localhost:3002/api/v1/products/#{@review["product_id"]}")
	end
end
