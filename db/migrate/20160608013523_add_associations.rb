class AddAssociations < ActiveRecord::Migration
  def change
    add_belongs_to :leaders, :troop, index: true
    add_belongs_to :patrol_leaders, :patrol, index: true
    add_belongs_to :scouts, :patrol
  end
end
