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

  describe '#services' do
    let(:not_supported_service) {FactoryGirl.create :service}
    let(:partner) { FactoryGirl.create :partner }

    before(:each) {not_supported_service}
    subject{partner.services}

    it {expect(subject).to include(partner.available_services.first.service)}
    it {expect(subject).not_to include(not_supported_service)}
  end

  describe '#payments' do
    let(:partner)          { FactoryGirl.create :partner }
    let(:partners_payment) { FactoryGirl.create :payment, order:  FactoryGirl.create(:order, partner: partner)}
    let(:other_payment)    { FactoryGirl.create :payment }

    before(:each) do
      partners_payment && other_payment
    end

    subject{partner.payments}

    it {expect(subject).to     include(partners_payment)}
    it {expect(subject).not_to include(other_payment)}
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


    describe 'update attributes' do
      let(:services_box) {FactoryGirl.create :services_box}
      describe 'add' do
        let(:partner) { FactoryGirl.create :partner }
        subject{partner.update_attributes(services_box_ids: [services_box.id])}

        it 'creates new available_services if service not supported by partner' do
          expect{subject}.to change{partner.reload.available_services.count}.by(3)
        end
      end

      describe 'remove' do
        let(:partner) { FactoryGirl.create :partner }
        before(:each) { partner.services_boxes << services_box}
        subject{partner.update_attributes(services_box_ids: [])}

        it 'creates new available_services if service not supported by partner' do
          expect{subject}.to change{partner.reload.available_services.count}.by(-3)
        end
      end
    end

  end




end