class ProductsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@products = HTTParty.get("http://localhost:3002/api/v1/products")
		# render json: @products
	end

	def show
		@product = HTTParty.get("http://localhost:3002/api/v1/products/#{params[:id]}")
		# To get category record
		@category = HTTParty.get("http://localhost:3001/api/v1/categories/#{@product["category_id"]}")
	end

	def create
		product = {}
		product["name"] = params[:name]
		product["price"] = params[:price]
		product["category_id"] = params[:category_id]
		@product = HTTParty.post("http://localhost:3002/products", body: {"name" => product})

		# @products.save
		render text: "complrtrd"
		
	end


	private
	def product_params
		params[:product].permit(:name, :price, :category_id)
	end
end
