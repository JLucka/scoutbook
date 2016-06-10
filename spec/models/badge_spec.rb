require 'rails_helper'

RSpec.describe Badge, type: :model do
  describe "factory" do
    subject { build :badge }
    before { create :badge }
    it { is_expected.to be_valid }
  end
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:scout) }
    it { should validate_presence_of(:stars) }
    it { should validate_presence_of(:opened_at) }
    it { should belong_to(:scout) }
  end

  it 'is not valid with bad stars number' do
    expect { build(:badge, stars: :"****") }.to raise_error(ArgumentError).with_message(/is not a valid stars/)
  end

  describe 'close' do
    it 'sets closed at time' do
      badge = FactoryGirl.create(:badge)
      badge.close
      expect(badge.closed_at).not_to be_nil
    end
  end
end
