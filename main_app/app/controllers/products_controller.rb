class ProductsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@products = HTTParty.get("http://localhost:3002/api/v1/products")
		# render json: @products
	end

	def new
		@result = HTTParty.get("http://localhost:3001/api/v1/categories")
		@categories = JSON.parse(@result.body)
		# binding.pry
	end

	def create
		@product = HTTParty.post("http://localhost:3002/products", body: {product: {name: params[:name], price: params[:price], category_id: params[:category_id]}})
		# binding.pry
		redirect_to products_path
	end

	def edit
		@result = HTTParty.get("http://localhost:3001/api/v1/categories")
		@categories = JSON.parse(@result.body)
		# binding.pry
		@product = HTTParty.get("http://localhost:3002/api/v1/products/#{params["id"]}")
		# binding.pry
	end

	def update
		@product = HTTParty.patch("http://localhost:3002/products/#{params["id"]}", body: {product: {name: params[:name], price: params[:price], category_id: params[:category_id]}})
		redirect_to products_path
	end

	def show
		@product = HTTParty.get("http://localhost:3002/api/v1/products/#{params[:id]}")
		# To get category record
		@category = HTTParty.get("http://localhost:3001/api/v1/categories/#{@product["category_id"]}")
	end
end
