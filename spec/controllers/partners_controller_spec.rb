require 'rails_helper'

RSpec.describe PartnersController, :type => :controller do

  describe "GET show" do

    let(:partner) {FactoryGirl.create :partner}

    before :each do
      sign_in partner
    end

    it 'returns http success' do
      get :show
      expect(response).to be_success
    end

    it 'assigns current_parrtner as @partner' do
      get :show
      expect(assigns(:partner)).to eq(partner)
    end
  end

  describe 'PUT update' do
    let(:partner) {FactoryGirl.create :partner}

    before :each do
      sign_in partner
      request.accept = 'application/json'
    end

    context 'valid attributes' do
      let(:attributes) { {email: 'new@email.com'} }

      it 'returns status updated' do
        put :update, partner: attributes
        expect(response).to have_http_status(:ok)
      end
    end

    context 'invalid attributes' do
      let(:attributes) { {email: 'newemail.com'} }
      it 'returns status unprocessable_entity' do
        put :update, partner: attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
