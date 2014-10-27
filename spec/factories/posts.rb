FactoryGirl.define do
  factory :post, class: 'Blog::Post' do
    name 'post'
    association :category
  end
end