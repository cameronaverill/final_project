class CreateUserDishJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :dishes do |t|
      # t.index [:user_id, :dish_id]
      # t.index [:dish_id, :user_id]
    end
  end
end
