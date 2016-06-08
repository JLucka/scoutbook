class Troop < ActiveRecord::Base
  has_many :patrols
  has_many :scouts, through: :patrols
  has_many :leaders

  validates :full_name, :name, :number, :region, :district, presence: true
  validates_numericality_of :number
end
