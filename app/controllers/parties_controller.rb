class PartiesController < ApplicationController
	def new
		@party = Party.new
	end

	def create
		@party = Party.new(party_params)
		if @party.save
			current_user.parties << @party
			redirect_to party_path(@party)
		else 
			render 'new'
		end
	end

	def edit
		@party = Party.find(params[:id])
	end
	
	def update
      @party = Party.find(params[:id])
      if @party.update(party_params)
        redirect_to party_path(@party)
      else
          render 'edit'
      end
    end

	def index
		@parties = current_user.parties.all
	end

	def show
		@party = Party.find(params[:id])
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

	def invite_friend_to_party
		@party = Party.find(params[:id])
		if current_user.parties.empty? || !(current_user.parties.include?(@party)) 
	    	current_user.parties << @party
	    end
	    flash[:notice] = "RSVP'd to party successfully"
	    redirect_to user_party_path(current_user, @party)
	end

	def attend
		@party = Party.find(params[:party_id])
		if !@party.users.include?(current_user)
  			current_user.parties << @party
  		end
  		@party.save
  		flash[:notice] = "RSVP'd to party successfully"
  		redirect_to party_path(@party)
	end


	private
		def party_params
			params.require(:party).permit(:name, :date, :location, :user_ids => [], :dish_ids => [])
		end
end