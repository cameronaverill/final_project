class AddDietToUser < ActiveRecord::Migration
  def change
    add_reference :users, :diet, index: true, foreign_key: true
  end
end
