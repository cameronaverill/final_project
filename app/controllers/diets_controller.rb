class DietsController < ApplicationController
	def new
		@diet = Diet.new
	end

	def create
		@diet = Diet.create!(diet_params)
		if @diet.save
			redirect_to current_user
		else
			render 'new'
		end
	end

	def edit
		@diet = Diet.find(params[:id])
	end

	def update
		@diet = Diet.find(params[:id])
		if @diet.save
			redirect_to current_user
		else
			render 'edit'
		end
	end

	private
		def diet_params
			params.require(:diet).permit(:name)
		end
end