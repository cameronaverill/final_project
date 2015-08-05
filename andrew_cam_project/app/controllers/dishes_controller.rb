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

	def add_dish
		@dish = Dish.find(params[:id])
		unless current_user.dishes.find(@dish.id)
	    	current_user.dishes << @dish
	    end
	    flash[:notice] = "Snack successfully saved"
	    redirect_to dish_path(@dish)
	end


	private
		def dish_params
			params.require(:dish).permit(:name, :url, :query_id, :vegan, :servings, :vegetarian, :cheap, :gluten_free, :image, :user_ids => [])
		end

end