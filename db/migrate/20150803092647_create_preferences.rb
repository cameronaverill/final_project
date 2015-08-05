class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :allowed_ingredient
      t.string :excluded_ingredient
      t.string :allowed_allergy
      t.string :allowed_diet
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
