require 'rails_helper'

RSpec.describe OrderStrategy do
  describe 'normal strategy' do
    before do
      troop = FactoryGirl.create(:troop)
      scout = FactoryGirl.create(:scout, position: 'Team Leader')
      leader = FactoryGirl.create(:leader, scout: scout, troop: troop)
      @order = FactoryGirl.create(:order, troop: troop)
    end
    it 'describes order parametres' do
      strategy = OrderStrategy.new(@order)
      strategy.describe_order
      expect(strategy.signature).to_not be_nil
    end
    it 'returns different orders for summer and winter' do
      strategy_summer = CampOrderStrategy.new(@order)
      strategy_winter = WinterOrderStrategy.new(@order)
      strategy_summer.describe_order
      strategy_winter.describe_order
      expect(strategy_summer.middle).to_not eq(strategy_winter.middle)
    end
    it 'describes open and closed badges' do
      open_badge = FactoryGirl.create(:badge, name: 'Higienistka')
      open_badge.update(opening_order_id: @order.id)
      closed_badge = FactoryGirl.create(:badge, name: 'Chmurka', closing_order: @order)
      strategy = OrderStrategy.new(@order)
      strategy.describe_order
      expect(strategy.badges[0]).to include('Higienistka')
      expect(strategy.badges[1]).to include('Chmurka')
    end
  end
end
