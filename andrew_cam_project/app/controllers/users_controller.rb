class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @query = params[:query]
    @diet = @user.diet.name

    if @query.presence
      #change number in the get request for demonstration; right now keep it at 1 for purpose of keeping requests down
      response = Unirest.get "https://webknox-recipes.p.mashape.com/recipes/search?diet=#{@diet}&query=#{@query}&number=1" , 
      headers:{
      "X-Mashape-Key" => "8nBXNLJkYlmshUJzjuIrdsM2ciHpp1JTDOmjsnF4J7juwQORb1",
      "Accept" => "application/json"
      }
      @dishes = (response.body)["results"]
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	if @user.save
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end


  private
  def user_params
  	params.require(:user).permit(:diet_id, :name)
  end



end