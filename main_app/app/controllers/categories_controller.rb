class CategoriesController < ApplicationController

	def index
  		# binding.pry
  		@categories = HTTParty.get("http://localhost:3001/api/v1/categories")
  		# @category = JSON.parse(@categories.body)
	end

	def new
		
	end

	def create
		# category = {}
		@category = HTTParty.post("http://localhost:3001/categories", body: {category: {name: params[:name]}})
		redirect_to categories_path
	end

	def category
		@category = HTTParty.get("http://localhost:3001/categories")
	end

	def post
		@category = HTTParty.post("http://localhost:3001/categories", body: {category: {name: params[:name]}})
		redirect_to categories_path
	end

	def edit
		@category = HTTParty.get("http://localhost:3001/api/v1/categories/#{params["id"]}")
		# @result = JSON.parse(@category.body)
		# binding.pry
	end

	def update
		@category = HTTParty.patch("http://localhost:3001/categories/#{params["id"]}", body: {category: {name: params[:name]}})
		redirect_to categories_path
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
