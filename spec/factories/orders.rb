# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    cost 1.5
    status 'new'
    client_info {build :client_info}
    partner { create :partner }
    after :build do |order|
      order.service ||= order.partner.available_services.first.try :service unless order.partner.nil?
    end
  end
end
