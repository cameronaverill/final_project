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

	def save_my_previous_url
	    # session[:previous_url] is a Rails built-in variable to save last url.
	    session[:my_previous_url] = URI(request.referer || '').path
	end

	private
		def dish_params
			params.require(:dish).permit(:name, :url, :query_id, :vegan, :servings, :vegetarian, :cheap, :gluten_free, :user_ids => [])
		end

end