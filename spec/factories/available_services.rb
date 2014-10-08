# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :available_service, class: 'AvailableService' do
    service {create :service}
  end
end
