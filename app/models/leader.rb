class Leader < ActiveRecord::Base
  has_one :user, as: :accountable
  has_one :scout, as: :scoutable
  belongs_to :troop

  attr_accessor :scout_id, :position, :user_id

  validates :troop_id, :leader_rank, presence: true

  enum leader_rank: [:brak, :pwd, :phm, :hm]
  FULL_RANKS = {:brak => "Brak", :pwd => "Przewodniczka", :phm => "Podharcmistrzyni",
                 :hm => "Harcmistrzyni"}

  def self.get_full_rank_name(rank)
    FULL_RANKS[rank.to_sym]
  end

end
