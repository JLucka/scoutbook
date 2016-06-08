class CreateTroops < ActiveRecord::Migration
  def change
    create_table :troops do |t|
      t.string :name, null: false
      t.string :full_name, null: false
      t.integer :number
      t.string :patron
      t.string :district
      t.string :region
      t.timestamps null: false
    end
  end
end