class Patrol < ActiveRecord::Base
  belongs_to :troop
  has_one :patrol_leader
  has_many :scouts
end
