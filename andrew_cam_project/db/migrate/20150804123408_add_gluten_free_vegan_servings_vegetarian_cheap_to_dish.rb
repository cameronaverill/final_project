class AddGlutenFreeVeganServingsVegetarianCheapToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :vegan, :boolean
    add_column :dishes, :gluent_free, :boolean
    add_column :dishes, :servings, :integer
    add_column :dishes, :vegetarian, :boolean
    add_column :dishes, :cheap, :boolean
  end
end
