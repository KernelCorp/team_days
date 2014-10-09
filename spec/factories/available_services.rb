# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :available_service, class: 'AvailableService' do
    price 12.0
    service {create :service}
  end
end
