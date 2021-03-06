require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do

  describe 'private api' do
    let(:order)   {FactoryGirl.create :order}

    before :each do
      sign_in order.partner
      request.accept = 'application/json'
    end

    it_behaves_like 'sortable controller' do
      before :each do
        FactoryGirl.create :order, partner: order.partner, created_at: DateTime.now
        FactoryGirl.create :order, partner: order.partner, created_at: Date.yesterday
      end
      let(:model_name) {'Order'}
      let(:sorting_field) {'created_at'}
    end

    describe "GET index" do
      it "assigns all orders as @orders" do
        get :index
        expect(assigns(:orders)).to eq([order])
      end
    end

    describe "GET show" do
      it "assigns the requested order as @order" do
        get :show, {id: order.to_param}
        expect(assigns(:order)).to eq(order)
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
         {status: 'close'}
        }

        it "updates the requested order" do
          expect {
            put :update, {:id => order.to_param, :order => new_attributes}
          }.to change{order.reload.status}.to('close')
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested order" do
        expect {
          delete :destroy, {:id => order.to_param}
        }.to change(Order, :count).by(-1)
      end
    end
  end

end
