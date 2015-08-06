class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.integer :month
      t.integer :day
      t.string :location

      t.timestamps null: false
    end
  end
end
