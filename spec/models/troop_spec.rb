require 'rails_helper'

RSpec.describe Troop, type: :model do
  describe "factory" do
    subject { build :troop }
    before { create :troop   }
    it { is_expected.to be_valid }
  end
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:number) }
    it { should validate_numericality_of(:number) }
    it { should validate_presence_of(:region) }
    it { should validate_presence_of(:district) }
    it { should have_many(:scouts) }
    it { should have_many(:patrols) }
    it { should have_many(:leaders) }
    it { should have_many(:orders) }
  end

  describe 'team_leader' do
    it 'correctly returns team leader of the team' do
      troop = FactoryGirl.create(:troop)
      scout = FactoryGirl.create(:scout, position: 'Team Leader')
      leader = FactoryGirl.create(:leader, scout: scout, troop: troop)
      expect(troop.team_leader).to eq(scout)
    end
  end

  describe 'scout_count' do
    it 'correctly counts all scouts' do
      troop = FactoryGirl.create(:troop)
      scout = FactoryGirl.create(:scout, position: 'Team Leader')
      leader = FactoryGirl.create(:leader, scout: scout, troop: troop)
      patrol = FactoryGirl.create(:patrol, troop: troop)
      second_scout = FactoryGirl.create(:scout, patrol: patrol)
      expect(troop.get_scout_count).to eq(2)
    end
  end
end
