require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "factory" do
    subject { build :order }
    before { create :order }
    it { is_expected.to be_valid }
  end
  describe "validations" do
    it { should belong_to(:troop) }
  end
  describe 'close' do
    it 'sets closed at time' do
      order = FactoryGirl.create(:order)
      order.close
      expect(order.finished_at).not_to be_nil
    end
    it 'sets open to false' do
      order = FactoryGirl.create(:order)
      order.close
      expect(order.open).to eq(false)
    end
  end
  describe 'get_describer' do
    it 'gets correct describer type' do
      order = FactoryGirl.create(:order)
      describer = order.get_describer("camp")
      expect(describer).to be_a CampOrderStrategy
    end
    it 'gets normal describer if no type is given' do
      order = FactoryGirl.create(:order)
      describer = order.get_describer
      expect(describer).to be_a OrderStrategy
    end
  end
  it 'correctly returns full_number' do
    order = FactoryGirl.create(:order, number: 12)
    expect(order.full_number).to eq("Rozkaz L12/15/16")
  end
end
