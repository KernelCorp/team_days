require 'rails_helper'

RSpec.describe PaymentsController, :type => :controller do

  describe 'private api' do
    let(:payment)   {FactoryGirl.create :payment}

    before :each do
      sign_in payment.order.partner
      request.accept = 'application/json'
    end

    it_behaves_like 'sortable controller' do
      let(:model_name) {'Payment'}
      let(:sorting_field) {'created_at'}
    end

    describe "GET index" do
      it "assigns all payments as @payments" do
        get :index
        expect(assigns(:payments)).to eq([payment])
      end
    end

    describe "GET show" do
      it "assigns the requested payment as @payment" do
        get :show, {id: payment.to_param}
        expect(assigns(:payment)).to eq(payment)
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          {status: 'paid'}
        }

        it "updates the requested payment" do
          expect {
            put :update, {:id => payment.to_param, :payment => new_attributes}
          }.to change{payment.reload.status}.to('paid')
        end
      end
    end

  end

end
