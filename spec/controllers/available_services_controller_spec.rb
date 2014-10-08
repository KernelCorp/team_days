require 'rails_helper'

RSpec.describe AvailableServicesController, :type => :controller do

  let(:partner) {FactoryGirl.create :partner}

  before :each do
    sign_in partner
    request.accept = 'application/json'
  end

  describe "GET index" do
    it "assigns all available_services as @available_services" do
      get :index
      expect(assigns(:available_services)).to eq(partner.available_services)
    end
  end

  describe "GET show" do
    it "assigns the requested available_service as @available_service" do
      get :show, {id: partner.available_services.first.to_param}
      expect(assigns(:available_service)).to eq(partner.available_services.first)
    end
  end

  describe "PUT update" do
    context "with valid params" do
      let(:new_attributes) {
        {price: 20.0}
      }

      it "updates the requested available_service" do
        available_service = partner.available_services.first
        expect {
          put :update, {:id => available_service.to_param, :available_service => new_attributes}
        }.to change{available_service.reload.price}.to(20.0)
      end

    end

    context "with invalid params" do
      let(:invalid_attributes) {
        {price: 'dasdsad'}
      }

      it "assigns the available_service as @available_service" do
        available_service = partner.available_services.first
        put :update, {:id => available_service.to_param, :available_service => invalid_attributes}
        expect(assigns(:available_service)).to eq(available_service)
      end
    end
  end

end
