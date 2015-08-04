class AddDietDefaultToUser < ActiveRecord::Migration
  def change
    add_reference :users, :diet, index: true, foreign_key: true, :default => Diet.find_by(name: 'none').id
  end
end
