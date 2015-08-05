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

		response = Unirest.post "https://webknox-recipes.p.mashape.com/recipes/visualizeRecipe",
		  headers:{
		    "X-Mashape-Key" => "8nBXNLJkYlmshUJzjuIrdsM2ciHpp1JTDOmjsnF4J7juwQORb1"
		  },
		  parameters:{
		    "author" => "John Doe",
		    "backgroundColor" => "#ffffff",
		    "backgroundImage" => "background1",
		    "fontColor" => "#333333",
		    "image" => File.new("<file goes here>"),
		    "ingredients" => "2 cups of green beans",
		    "instructions" => "cook the beans",
		    "mask" => "ellipseMask",
		    "readyInMinutes" => 45,
		    "servings" => 2,
		    "source" => "spoonacular.com",
		    "title" => "Pork tenderloin with green beans"
		  }
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