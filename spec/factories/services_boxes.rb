# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :services_box do
    name "MyString"
    price 1.5
    services {[create(:service), create(:service), create(:service)]}
  end
end
