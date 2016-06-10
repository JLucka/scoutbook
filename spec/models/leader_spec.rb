require 'rails_helper'

RSpec.describe Leader, type: :model do
  describe "factory" do
    subject { build :leader }
    before { create :leader  }
    it { is_expected.to be_valid }
  end
  describe "validations" do
    it { should validate_presence_of(:leader_rank) }
    it { should validate_presence_of(:troop_id) }
    it { should have_one(:scout) }
    it { should have_one(:user) }
    it { should belong_to(:troop) }
  end

  it 'is not valid with bad leader rank' do
    expect { build(:leader, leader_rank: :super_hm) }.to raise_error(ArgumentError).with_message(/is not a valid leader_rank/)
  end

  it 'gets correct full rank name from string' do
    full_rank = Leader.get_full_rank_name("pwd")
    expect(full_rank).to eq("Przewodniczka")
  end

end
