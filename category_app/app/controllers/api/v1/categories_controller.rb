class Api::V1::CategoriesController < ApplicationController

	def index
		@categories = Category.all
		render json: @categories
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			render json: @category
		else
			render json: {errors: @category.errors.full_messages }
		end
		end
	end

	def show
		@category = Category.find(params[:id])
		render json: @category
	end
end
