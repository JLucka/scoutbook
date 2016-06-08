class AddOrderIdToBadges < ActiveRecord::Migration
  def change
    add_belongs_to :badges, :closing_order, index: true
    add_belongs_to :badges, :opening_order, index: true
  end
end
