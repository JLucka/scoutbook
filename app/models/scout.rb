class Scout < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates :pesel, format: { with: /\d{11}/, message: 'Pesel must consist of 11 digits' }

  has_many :badges
  belongs_to :scoutable, polymorphic: true
  belongs_to :patrol

  enum rank: [:bs, :hpp, :och, :trop, :sam, :wedr, :HR]
  @full_ranks = {:bs => "Bez Stopnia", :hpp => "Harcerka po próbie", :och => "Ochotniczka",
  :trop => "Tropicielka", :sam => "Samarytanka", :wedr => "Wędrowniczka", :HR => "Harcerka Rzeczypospolitej"}

  def full_name
    "#{rank}. #{first_name} #{last_name}"
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
    @full_ranks[rank.to_sym]
  end
end
