class RemoveGluentFreeFromDish < ActiveRecord::Migration
  def change
    remove_column :dishes, :gluent_free, :boolean
  end
end
