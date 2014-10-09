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

  describe '#update_cost' do

    it 'runs before create' do
      order = FactoryGirl.build :order
      expect(order.cost).not_to be_nil
    end

    context 'partners present' do
      let(:order) { FactoryGirl.create :order }

      it 'sets available_service price' do
        expect(order.cost).to eq(order.partner.available_services.where(service: order.service).first.price)
      end
    end

    context 'partners is nil' do
      let(:order) { FactoryGirl.create :order, partner: nil, service: FactoryGirl.create(:service) }

      it 'sets service price' do
        expect(order.cost).to eq(order.service.price)
      end
    end
  end
end
