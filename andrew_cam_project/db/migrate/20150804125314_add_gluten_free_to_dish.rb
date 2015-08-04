class AddGlutenFreeToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :gluten_free, :boolean
  end
end
