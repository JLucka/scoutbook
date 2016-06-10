class Badge < ActiveRecord::Base
  belongs_to :scout
  belongs_to :closing_order, :class_name => 'Order', :foreign_key => 'closing_order_id'
  belongs_to :opening_order, :class_name => 'Order', :foreign_key => 'opening_order_id'

  validates :scout, :name, :stars, :opened_at, presence: true

  enum stars: [:*, :**, :"***", :M]

  def close
    self.closed_at = DateTime.now
    self.save
  end
end