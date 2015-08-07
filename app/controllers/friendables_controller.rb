class FriendablesController < ApplicationController
	# POST /friendships
	   # POST /friendships.json
	   def create
	     @friendable = current_user.friendables.build(:from_id => params[:from_id], approved: "false")
	     if @friendable.save
	       flash[:notice] = "Friend requested."
	       redirect_to :back
	     else
	       flash[:error] = "Unable to request friendship."
	       redirect_to :back
	     end
	   end

	   # PATCH/PUT /friendships/1
	   # PATCH/PUT /friendships/1.json
	   def update
	   @friendable = Friendable.where(from_id: current_user, to_id: params[:id]).first
	   @friendable.update(approved: true)
	     if @friendable.save
	       redirect_to root_url, :notice => "Successfully confirmed friend!"
	     else
	       redirect_to root_url, :notice => "Sorry! Could not confirm friend!"
	     end
	   end

	   # DELETE /friendships/1
	   # DELETE /friendships/1.json
	   def destroy
	     @friendable = Friendable.where(from_id: [current_user, params[:id]]).where(to_id: [current_user, params[:id]]).last
	     @friendable.destroy
	     flash[:notice] = "Removed friendship."
	     redirect_to :back
	   end
end