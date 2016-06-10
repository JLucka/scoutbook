require 'rails_helper'

RSpec.describe Patrol, type: :model do
  describe "factory" do
    subject { build :patrol }
    before { create :patrol   }
    it { is_expected.to be_valid }
  end
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:troop_id) }
    it { should have_many(:scouts) }
    it { should have_one(:patrol_leader) }
    it { should belong_to(:troop) }
  end

end
