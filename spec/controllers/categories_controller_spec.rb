require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe '#index' do
    subject {get :index}
    before do
      FactoryGirl.create :category, name: 'cat_one'
      FactoryGirl.create :category, name: 'cat_two'
      NilClass.any_instance.stub(:count).and_return nil
    end
    it 'expect collection' do
      expect{subject}.to change{assigns(:categories).count}.to(2)
    end
  end

  describe '#show' do
    subject {get :show, id: 'cat-one'}
    before do
      FactoryGirl.create :category, name: 'cat_one'
      FactoryGirl.create :category, name: 'cat_two'
    end
    it 'expect collection' do
      expect{subject}.to change{assigns(:category)}.to(Blog::Category)
    end
  end

end