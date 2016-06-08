class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :open, default: true
      t.integer :number
      t.datetime :finished_at
      t.string :quote
      t.belongs_to :troop, index: true
      t.timestamps null: false
    end
  end
end
