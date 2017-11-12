class CategoriesController < ApplicationController

	def index
  		# binding.pry
  		@categories = HTTParty.get("http://localhost:3001/api/v1/categories")
  		# @category = JSON.parse(@categories.body)
	end

	def create
		category = {}
		@category = HTTParty.post("http://localhost:3001/api/v1/categories", body: {"category" => category})
	end

	def show
		# if params[:id]
			@category = HTTParty.get("http://localhost:3001/api/v1/categories/#{params[:id]}")
			@products = HTTParty.get("http://localhost:3002/api/v1/products/fetch_by_category?category_id=#{@category["id"]}")
			# binding.pry
			# @category = JSON.parse(@result.body) 
		# end
	end
end
