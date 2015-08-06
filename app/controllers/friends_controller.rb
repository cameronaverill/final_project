class FriendsController < ApplicationController
  before_action :set_friend, only: :destroy

    def index
      @friends = current_user.friends
      @friend_query = params[:friend_query]
      if @friend_query.presence
          @search_users = User.basic_search(@friend_query)
      else
          @search_users = User.all
      end
      @search_users = @search_users.order(name: :desc)
    end

    def destroy  
      current_user.remove_friend(@friend)
      head :no_content
    end  

    private

      def set_friend
        @friend = current_user.friends.find(params[:id])
      end 

end
