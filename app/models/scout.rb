class Scout < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates :pesel, format: { with: /\d{11}/, message: 'Pesel must consist of 11 digits' }

  has_many :badges
  belongs_to :scoutable, polymorphic: true
  belongs_to :patrol

  enum rank: [:bs, :hpp, :och, :trop, :sam, :wedr, :HR]
  FULL_RANKS = {:bs => "Bez Stopnia", :hpp => "Harcerka po próbie", :och => "Ochotniczka",
  :trop => "Tropicielka", :sam => "Samarytanka", :wedr => "Wędrowniczka", :HR => "Harcerka Rzeczypospolitej"}

  def full_name
    if scoutable_type == "Leader" && scoutable.leader_rank != "brak"
      "#{scoutable.leader_rank}. #{first_name} #{last_name} #{rank}."
    else
      "#{rank}. #{first_name} #{last_name}"
    end
  end

  def troop
    if self.scoutable_type == "Leader"
      self.scoutable.troop
    else
      self.patrol.troop
    end
  end

  private

  def self.get_full_rank_name(rank)
    FULL_RANKS[rank.to_sym]
  end
end
