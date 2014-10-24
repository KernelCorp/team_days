FactoryGirl.define do
  factory :post do
    name 'post'
    association :category
  end
end