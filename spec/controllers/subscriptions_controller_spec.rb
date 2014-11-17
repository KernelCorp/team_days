require 'rails_helper'

RSpec.describe SubscriptionsController, :type => :controller do

  let(:subscription){ FactoryGirl.create :subscription }

  describe 'POST create' do
    before(:each) {request.accept = 'application/json'}

    let(:category) { FactoryGirl.create :category }

    it 'assigns new subscription as @subscription' do
      post :create, subscription: {email: 'newemail@example.com', category_attributes: {1 => {id: category.id, _destroy: 0}}}
      expect(assigns :subscription).to be_a(Subscription)
    end

    context 'new subscription' do
      subject{post :create, subscription: {email: 'newemail@example.com', category_attributes: {1 => {id: category.id, _destroy: 0}}}}
      it 'creates new subscription' do
        expect{subject}.to change{Subscription.count}.by(1)
      end
    end

    context 'existing subscription' do
      subject{post :create, subscription: {email: subscription.email, category_attributes: {1 => {id: category.id, _destroy: 0}}}}
      it 'does not create new subscription' do
        subscription
        expect{subject}.not_to change{Subscription.count}
      end

      it 'updates entity' do
        expect{subject}.to change{subscription.reload.categories.count}.by(1)
      end
    end
  end

end