require 'rails_helper'

RSpec.describe PatrolLeader, type: :model do
  describe "factory" do
    subject { build :patrol_leader }
    before { create :patrol_leader  }
    it { is_expected.to be_valid }
  end
  describe "validations" do
    it { should validate_presence_of(:patrol_id) }
    it { should have_one(:scout) }
    it { should have_one(:user) }
    it { should belong_to(:patrol) }
  end
end
