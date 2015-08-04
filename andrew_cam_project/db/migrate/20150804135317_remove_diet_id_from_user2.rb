class RemoveDietIdFromUser2 < ActiveRecord::Migration
  def change
    remove_reference :users, :diet, index: true, foreign_key: true
  end
end
