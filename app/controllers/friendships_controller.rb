class FriendshipsController < ApplicationController
      # POST /friendships
      # POST /friendships.json

        def index
        @search_query = params[:search_query]
          if @search_query 
            @potential_friends = User.all.fuzzy_search(@search_query)
            @potential_friends = @potential_friends.order(name: :desc)
          else
            @potential_friends = ''
          end
    
        end

      def create
          @friendship = current_user.friendships.build(:friend_id => params[:friend_id], approved: false)
          if @friendship.save
            redirect_to :back
          else
            redirect_to :back
          end
      
      end

      # PATCH/PUT /friendships/1
      # PATCH/PUT /friendships/1.json
      def update
      @friendship = Friendship.where(friend_id: current_user, user_id: params[:id]).first
      @friendship.update(approved: true)
        if @friendship.save
          redirect_to root_url
        else
          redirect_to root_url
        end
      end

      # DELETE /friendships/1
      # DELETE /friendships/1.json
      def destroy
        @friendship = Friendship.where(friend_id: [current_user, params[:id]]).where(user_id: [current_user, params[:id]]).last
        @friendship.destroy
        redirect_to :back
      end

end
