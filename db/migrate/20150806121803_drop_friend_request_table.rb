class DropFriendRequestTable < ActiveRecord::Migration
  def change
  	drop_table :friend_requests
  	drop_table :friendships 
  end
end
