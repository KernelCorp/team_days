# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    sum 1.5
    status 'new'
    association :order
  end
end
