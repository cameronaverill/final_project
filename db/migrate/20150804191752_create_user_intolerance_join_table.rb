class CreateUserIntoleranceJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :intolerances do |t|
      # t.index [:user_id, :intolerance_id]
      # t.index [:intolerance_id, :user_id]
    end
  end
end
