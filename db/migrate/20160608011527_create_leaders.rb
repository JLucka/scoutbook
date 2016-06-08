class CreateLeaders < ActiveRecord::Migration
  def change
    create_table :leaders do |t|
      t.integer :leader_rank, default: 0
      t.string :phone
      t.string :courses, array: true, default: []
      t.timestamps null: false
    end
  end
end
