require 'rails_helper'

RSpec.describe Scout, type: :model do
  describe "factory" do
    subject { build :scout }
    before { create :scout  }
    it { is_expected.to be_valid }
  end
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should allow_value('12345678901').for(:pesel) }
    it { should_not allow_value('123').for(:pesel) }
    it { should_not allow_value('abcdefghiuj').for(:pesel) }
    it { should have_many(:badges) }
    it { should belong_to(:patrol) }
  end

  # it 'is not valid with bad leader rank' do
  #   expect { build(:leader, leader_rank: :super_hm) }.to raise_error(ArgumentError).with_message(/is not a valid leader_rank/)
  # end
  #
  it 'gets correct full rank name from string' do
    full_rank = Scout.get_full_rank_name("och")
    expect(full_rank).to eq("Ochotniczka")
  end

  describe 'full name' do
    it 'returns correct full name for non leader' do
      scout = FactoryGirl.create(:scout, first_name: 'Mania', last_name: 'Rozycka')
      expect(scout.full_name).to eq("och. Mania Rozycka")
    end

    it 'returns correct full name for leader with leader rank' do
      scout = FactoryGirl.create(:scout, first_name: 'Mania', last_name: 'Rozycka')
      leader = FactoryGirl.create(:leader, leader_rank: :pwd, scout: scout)
      expect(scout.full_name).to eq("pwd. Mania Rozycka och.")
    end

    it 'returns correct full name for leader without leader rank' do
      scout = FactoryGirl.create(:scout, first_name: 'Mania', last_name: 'Rozycka')
      leader = FactoryGirl.create(:leader, leader_rank: 0, scout: scout)
      expect(scout.full_name).to eq("och. Mania Rozycka")
    end
  end

  describe 'troop' do
    it 'returns correct troop for scout from patrol' do
      patrol = FactoryGirl.create(:patrol)
      scout = FactoryGirl.create(:scout, patrol: patrol)
      expect(scout.troop).to eq(patrol.troop)
    end

    it 'returns correct troop for leader' do
      scout = FactoryGirl.create(:scout)
      leader = FactoryGirl.create(:leader, scout: scout)
      expect(scout.troop).to eq(leader.troop)
    end

    it 'returns nil if scout doesnt belong to troop' do
      scout = FactoryGirl.create(:scout, patrol: nil)
      expect(scout.troop).to be_nil
    end
  end

end
