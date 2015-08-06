class AddDateToParty < ActiveRecord::Migration
  def change
    add_column :parties, :date, :date
  end
end
