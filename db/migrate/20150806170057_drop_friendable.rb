class DropFriendable < ActiveRecord::Migration
  def change
  	drop_table :friendables
  end
end
