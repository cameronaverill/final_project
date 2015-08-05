class AddDefaultIntolerancesToUser < ActiveRecord::Migration
  def change
  	change_column :intolerances, :vegan, :boolean, :default => false
  end
end
