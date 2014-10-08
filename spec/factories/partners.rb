# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :partner, :class => 'User::Partner' do
    sequence(:email) { |n| "partner#{n}@example.com" }
    password 'password123'

    available_services { [build(:available_service)] }
  end
end
