class Badge < ActiveRecord::Base
  belongs_to :scout
  validates :scout, :name, :stars, :opened_at, presence: true

  enum stars: [:*, :**, :"***", :M]
end
