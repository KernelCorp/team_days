# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client_info do
    name "MyString"
    phone "1234567890"
    email "clietn@example.com"
  end
end
