class DishesController < ApplicationController

	def create
		@dish = Dish.new(dish_params)
		if @dish.save
			redirect_to dish_path(@dish)
		else 
			render 'new'
		end
	end

	def show
		@dish = Dish.find(params[:id])
	end

	private
		def dish_params
			params.require(:dish).permit(:name, :url, :query_id)
		end

end