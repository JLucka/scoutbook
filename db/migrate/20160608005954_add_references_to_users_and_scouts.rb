class AddReferencesToUsersAndScouts < ActiveRecord::Migration
  def change
    add_reference :users, :accountable, polymorphic: true
    add_reference :scouts, :scoutable, polymorphic: true
  end
end
