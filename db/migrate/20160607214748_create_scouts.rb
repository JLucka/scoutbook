class CreateScouts < ActiveRecord::Migration
  def change
    create_table :scouts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :pesel
      t.string :address
      t.string :mothers_name
      t.string :fathers_name
      t.integer :rank
      t.string :position, default: "Szeregowa"
      t.timestamps null: false
    end
  end
end
