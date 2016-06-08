class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.integer :stars, default: 1
      t.belongs_to :scout, index: true
      t.datetime :opened_at, default: Time.now
      t.datetime :closed_at
      t.timestamps null: false
    end
  end
end
