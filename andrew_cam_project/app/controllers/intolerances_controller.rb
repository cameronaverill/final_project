class IntolerancesController < ApplicationController

	def new
		@intolerance = Intolerance.new
	end

	def create
		@intolerance = Intolerance.create!(intolerance_params)
		if @intolerance.save
			redirect_to current_user
		else
			render 'new'
		end
	end

	def edit
		@intolerance = Intolerance.find(params[:id])
	end

	def update
		@intolerance = Intolerance.find(params[:id])
		if @intolerance.save
			redirect_to current_user
		else
			render 'edit'
		end
	end

	private
		def diet_params
			params.require(:intolerance).permit(:diet, :user_ids => [])
		end
end