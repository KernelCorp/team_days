# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    name "new service"
    price 1.5
    description "MyText"
  end
end
