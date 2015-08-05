class AddDietDefaultToUser < ActiveRecord::Migration
  def change
    add_reference :users, :diet, index: true, foreign_key: true, :default => 0
  end
end
