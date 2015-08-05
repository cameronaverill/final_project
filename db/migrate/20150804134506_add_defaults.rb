class AddDefaults < ActiveRecord::Migration
  def change
  	change_column :dishes, :vegan, :boolean, :default => false
  	change_column :dishes, :vegetarian, :boolean, :default => false
  	change_column :dishes, :cheap, :boolean, :default => false
  	change_column :dishes, :gluten_free, :boolean, :default => false
  	change_column :dishes, :servings, :integer, :default => 0
  end
end
