class CategoriesController < ApplicationController

	skip_before_action :verify_authenticity_token
	def create
		@category = Category.new(category_params)
		if @category.save
			render json: @category
		else
			render json: {errors: @category.errors.full_messages}
		end
	end

	# def edit
	# 	@category = Category.find(params[:id])
	# 	render json: @category
	# end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			render json: @category
		else
			render json: {errors: @category.errors.full_messages}
		end
	end

	def show
		@category = Category.find(params[:id])
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		render json: {notice: "Scuccessfully deleted the category"}
	end

	private

	def category_params
		params[:category].permit(:name)
	end
end
