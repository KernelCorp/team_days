require 'rails_helper'

describe TagsController, type: :controller do

  describe '#show' do

    before {FactoryGirl.create :tag, name: 'cats'}
    subject {get :show, id: 'cats'}

    it 'expect collection' do
      expect{subject}.to change{assigns(:tag)}.to(Blog::Tag)
    end
  end

end