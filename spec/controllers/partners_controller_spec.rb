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

end
