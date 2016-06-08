class CreatePatrols < ActiveRecord::Migration
  def change
    create_table :patrols do |t|
      t.string :name, null: false
      t.belongs_to :troop, index: true
      t.timestamps null: false
    end
  end
end
