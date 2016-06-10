class PatrolLeader < ActiveRecord::Base
  attr_accessor :scout_id, :user_id

  has_one :user, as: :accountable
  has_one :scout, as: :scoutable
  belongs_to :patrol

  validates :patrol_id, presence: true

end