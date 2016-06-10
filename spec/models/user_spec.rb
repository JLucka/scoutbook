require 'rails_helper'

RSpec.describe User, type: :model do
  describe "factory" do
    subject { build :user }
    before { create :user }
    it { is_expected.to be_valid }
  end
  describe 'troop' do
    it 'correctly returns troop for leader' do
      user = FactoryGirl.create(:user)
      leader = FactoryGirl.create(:leader, user: user)
      expect(user.troop).to eq(leader.troop)
    end
    it 'correctly returns troop for patrol leader' do
      user = FactoryGirl.create(:user)
      patrol_leader = FactoryGirl.create(:patrol_leader, user: user)
      expect(user.troop).to eq(patrol_leader.patrol.troop)
    end
  end

end
