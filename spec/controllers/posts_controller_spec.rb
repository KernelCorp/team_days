require 'rails_helper'

describe PostsController, type: :controller do

  describe '#show' do

    let(:post){FactoryGirl.create :post, name: 'post_one'}
    subject {get :show, id: post.to_param}

    it 'expect collection' do
      expect{subject}.to change{assigns(:post)}.to(Blog::Post)
    end
  end

end