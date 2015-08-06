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
		@user = User.find(params[:user_id])
	end

	def destroy
		@dish = Dish.find(params[:id])
		@dish.destroy
		redirect_to dishes_path(current_user)
	end

	def add_dish
		@dish = Dish.find(params[:id])
		if current_user.dishes.empty? || !(current_user.dishes.include?(@dish)) 
	    	current_user.dishes << @dish
	    end
	    flash[:notice] = "Snack successfully saved"
	    redirect_to user_dish_path(current_user, @dish)
	end


	private
		def dish_params
			params.require(:dish).permit(:name, :description, :url, :query_id, :vegan, :servings, :vegetarian, :cheap, :gluten_free, :image, :user_ids => [], :party_ids => [])
		end

end