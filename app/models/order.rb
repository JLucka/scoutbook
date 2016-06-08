class Order < ActiveRecord::Base
  has_many :opened_badges, foreign_key: "opening_order_id", class_name: "Badge"
  has_many :closed_badges, foreign_key: "closing_order_id", class_name: "Badge"
  belongs_to :troop

  def full_number
    "Rozkaz L#{number}/15/16"
  end
end
