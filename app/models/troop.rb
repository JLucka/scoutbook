class Troop < ActiveRecord::Base
  has_many :patrols
  has_many :scouts, through: :patrols
  has_many :leaders
  has_many :orders

  validates :full_name, :name, :number, :region, :district, presence: true
  validates_numericality_of :number

  def team_leader
    leader = self.leaders.joins(:scout).where(scouts: { position: "Team Leader" }).first.scout
  end

  def get_scout_count
    self.scouts.count + self.leaders.count
  end
end