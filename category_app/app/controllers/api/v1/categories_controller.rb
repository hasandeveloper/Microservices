class Api::V1::CategoriesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		@categories = Category.all
		render json: @categories
	end

	def edit
		@category = Category.find(params[:id])
		render json: @category
	end

	# def create
	# 	@category = Category.new(category_params)
	# 	if @category.save
	# 		render json: @category
	# 	else
	# 		render json: {errors: @category.errors.full_messages }
	# 	end
	# end

	def show
		@category = Category.find(params[:id])
		render json: @category
	end
end
