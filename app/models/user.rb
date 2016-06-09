class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :accountable, polymorphic: true

  def leader?
    accountable_type == "Leader"
  end

  def patrol_leader?
    accountable_type == "PatrolLeader"
  end

  def troop
    if leader?
      self.accountable.troop
    elsif patrol_leader?
      self.accountable.patrol.troop
    end
  end
end