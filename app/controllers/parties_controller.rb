class PartiesController < ApplicationController
	def create
		@party = Party.new(party_params)
		if @party.save
			redirect_to party_path(@party)
		else 
			render 'new'
		end
	end

	def index
		@party = current_user.parties.all
	end

	def show
		@party = Party.find(params[:id])
		@user = User.find(params[:user_id])
	end

	def destroy
		@party = Party.find(params[:id])
		@party.destroy
		redirect_to user_path(current_user)
	end

	def add_party
		@party = Party.find(params[:id])
		if current_user.parties.empty? || !(current_user.parties.include?(@party)) 
	    	current_user.parties << @party
	    end
	    flash[:notice] = "RSVP'd to party successfully"
	    redirect_to user_party_path(current_user, @party)
	end


	private
		def party_params
			params.require(:party).permit(:name, :day, :month, :location, :user_ids => [], :dish_ids => [])
		end
end