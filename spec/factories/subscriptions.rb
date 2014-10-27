# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    sequence(:email) { |n| "sub#{n}@example.com" }

    categories {[create(:category)]}
  end
end
