require 'rails_helper'

RSpec.describe AvailableService, :type => :model do
  describe '#price' do


    let(:available_service) {partner.available_services.first}

    context 'available service has price' do
      let(:partner) {FactoryGirl.create :partner, available_services: [FactoryGirl.build(:available_service, price: 20)]}
      subject {available_service.price}

      it { expect(subject).to eq(20) }

      it { expect(subject).not_to eq(available_service.service.price) }
    end

    context 'available service has not price' do
      let(:partner) {FactoryGirl.create :partner, available_services: [FactoryGirl.build(:available_service, price: nil)]}
      subject {available_service.price}

      it { expect(subject).to eq(available_service.service.price) }
    end
  end
end
