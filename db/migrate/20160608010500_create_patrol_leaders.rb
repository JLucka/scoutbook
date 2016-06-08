class CreatePatrolLeaders < ActiveRecord::Migration
  def change
    create_table :patrol_leaders do |t|
      t.string :phone
      t.string :course
      t.timestamps null: false
    end
  end
end
