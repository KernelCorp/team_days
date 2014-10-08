require 'rails_helper'

RSpec.describe User::Partner, type: :model do

  describe '#support_service?' do
    let(:not_supported_service) {FactoryGirl.create :service}
    let(:partner) { FactoryGirl.create :partner }

    it 'returns true if available service exist for service' do
      expect(partner.support_service? partner.available_services.first.service).to be_truthy
    end
    it 'returns false if available service does not exist for service' do
      expect(partner.support_service? not_supported_service).to be_falsey
    end
  end

  describe 'HABTM callbacks' do
    let(:services_box) {FactoryGirl.create :services_box}
    let(:partner) {
      FactoryGirl.create :partner,
                         available_services:
                             [FactoryGirl.build(:available_service, service: services_box.services.first)]
    }

    describe 'add services box' do

      subject{partner.services_boxes << services_box}

      it 'creates new available_services if service not supported by partner' do
        expect{subject}.to change{partner.reload.available_services.count}.by(2)
      end

    end
    describe 'remove services box' do

      subject{partner.services_boxes.delete services_box}

      it 'remove available services from partners' do
        expect{subject}.to change{partner.reload.available_services.count}.by(-1)
      end

    end
  end




end