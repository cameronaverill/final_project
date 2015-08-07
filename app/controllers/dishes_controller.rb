class DishesController < ApplicationController

	def new
		@dish = Dish.new
	end

	def create_party_dish
		@party = Party.find(params[:party_id])
		@party_query = params[:party_query]
		@diets = ''
		if @party.users.presence
			@party.users.each do |user|
					@diets << user.diet.name
					if user != @party.users.last
						@diets << '%2C+'
					end
			end
		end

		@intolerances = ''
		if @party.users.presence
		   @party.users.each do |user|
		   	if user.intolerances.presence 
		   		user.intolerances.each do |intolerance|
		   			@intolerances << intolerance.name
		    		if !(intolerance == user.intolerances.last && user == @party.users.last)
		      		@intolerances << '%2C+'
		      		end
		      end
		    end
		  end
		end

		if @party_query.presence
		  #change number in the get request for demonstration; right now keep it at 1 for purpose of keeping requests down
		  if @diet != 'none' 
		    if @intolerances.presence
		      response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?diet=#{@diets}&query=#{@party_query}&intolerances=#{@intolerances}&number=6" , 
		      headers:{
		      "X-Mashape-Key" => "8nBXNLJkYlmshUJzjuIrdsM2ciHpp1JTDOmjsnF4J7juwQORb1",
		      "Accept" => "application/json"
		      }
		      @dishes = (response.body)["results"]
		    else
		      response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?diet=#{@diets}&query=#{@party_query}&number=6" , 
		      headers:{
		      "X-Mashape-Key" => "8nBXNLJkYlmshUJzjuIrdsM2ciHpp1JTDOmjsnF4J7juwQORb1",
		      "Accept" => "application/json"
		      }
		      @dishes = (response.body)["results"]
		    end
		  else 
		    if @intolerances.presence
		      response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?query=#{@party_query}&intolerances=#{@intolerances}&number=6" , 
		      headers:{
		      "X-Mashape-Key" => "8nBXNLJkYlmshUJzjuIrdsM2ciHpp1JTDOmjsnF4J7juwQORb1",
		      "Accept" => "application/json"
		      }
		      @dishes = (response.body)["results"]
		    else
		      response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?query=#{@party_query}&number=6" , 
		      headers:{
		      "X-Mashape-Key" => "8nBXNLJkYlmshUJzjuIrdsM2ciHpp1JTDOmjsnF4J7juwQORb1",
		      "Accept" => "application/json"
		      }
		      @dishes = (response.body)["results"]
		    end
		  end
		end
	end

	def add_dish_to_party
		@party = Party.find(params[:party_id])
		@dish = Dish.find(params[:id])
		@party.dishes << @dish
		redirect_to party_path(@party)
	end

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