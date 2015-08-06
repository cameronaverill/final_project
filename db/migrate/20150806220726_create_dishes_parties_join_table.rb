class CreateDishesPartiesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :dishes, :parties do |t|
      # t.index [:dish_id, :party_id]
      # t.index [:party_id, :dish_id]
    end
  end
end
