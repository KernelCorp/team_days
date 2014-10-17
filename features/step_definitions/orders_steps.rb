And(/^the partner "(.*?)" has paid order of service "(.*?)" from "(.*?)" with status "(.*?)"$/) do |partner_email, service_name, client_email, status|
  partner = User::Partner.find_by email: partner_email
  service = Service.find_by name: service_name
  order = FactoryGirl.create :order, partner: partner, status: status, service: service
  order.build_client_info email: client_email
  order.payments << FactoryGirl.create(:payment, status: 'paid')
  order.save
end

And(/^the partner "(.*?)" has unpaid order of service "(.*?)" from "(.*?)" with status "(.*?)"$/) do |partner_email, service_name, client_email, status|
  partner = User::Partner.find_by email: partner_email
  service = Service.find_by name: service_name
  order = FactoryGirl.create :order, partner: partner, status: status, service: service
  order.build_client_info email: client_email
  order.save
end

And(/^I select filter by "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see orders from: "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

But(/^I shouldn't see orders from: "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  pending # express the regexp above with the code you wish you had
end

And(/^I change status on order "(.*?)" to "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^order from "(.*?)" has status "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end