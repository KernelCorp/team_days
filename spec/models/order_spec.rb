require 'rails_helper'

RSpec.describe Order, :type => :model do
  describe 'validation' do
    it 'is not valid if partner present but service is not supported' do
      order = FactoryGirl.build :order, service: FactoryGirl.create(:service)
      expect(order.valid?).to be_falsey
    end
    it 'is valid if partner not present' do
      order = FactoryGirl.build :order, partner: nil, service: FactoryGirl.create(:service)
      expect(order.valid?).to be_truthy
    end
    it 'is valid if partner present and service is supported' do
      order = FactoryGirl.build :order
      expect(order.valid?).to be_truthy
    end
  end
end
