require 'order_strategies.rb'
class Order < ActiveRecord::Base
  has_many :opened_badges, foreign_key: "opening_order_id", class_name: "Badge"
  has_many :closed_badges, foreign_key: "closing_order_id", class_name: "Badge"
  belongs_to :troop

  DESCRIBERS = {camp: CampOrderStrategy, winter: WinterOrderStrategy, normal: OrderStrategy}


  def get_describer(kind=nil)
    DESCRIBERS[kind && DESCRIBERS.keys.include?(kind.to_sym) ? kind.to_sym : :normal].new(self)
  end

  def full_number
    "Rozkaz L#{number}/15/16"
  end

  def close
    self.finished_at = Time.now
    self.open = false
    self.save
  end
end