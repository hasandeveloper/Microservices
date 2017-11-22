class ProductsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def new
		@product = Product.new
		render json: @product
	end
	
	def create
		@product = Product.new(product_params)
		#binding.pry
		if @product.save
			render json: @product
		else
			render json: { errors: @product.errors.full_messages }
		end
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			render json: @product
		else
			render json: {errors: @product.errors.full_messages }
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		render json: {notice: "Successfully deleted the product"}
	end

	private

	def product_params
		params[:product].permit(:name, :price, :category_id)
	end
end
