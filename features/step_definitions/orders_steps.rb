And(/^the partner "(.*?)" has paid order of service "(.*?)" from "(.*?)" with status "(.*?)"$/) do |partner_email, service_name, client_email, status|
  partner = User::Partner.find_by email: partner_email
  service = Service.find_by name: service_name
  order = FactoryGirl.create :order, partner: partner, status: status, service: service
  order.build_client_info email: client_email
  order.payments << FactoryGirl.create(:payment, status: 'paid')
  order.save
  order.update_attribute :cost, 1.5
end

And(/^the partner "(.*?)" has unpaid order of service "(.*?)" from "(.*?)" with status "(.*?)"$/) do |partner_email, service_name, client_email, status|
  partner = User::Partner.find_by email: partner_email
  service = Service.find_by name: service_name
  order = FactoryGirl.create :order, partner: partner, status: status, service: service, cost: 1.5
  order.build_client_info email: client_email
  order.save
  order.update_attribute :cost, 1.5
end

And(/^I select filter by "(.*?)" with "(.*?)"$/) do |name, value|
  page.find(".#{name} select").find('option', text: value).select_option
  page.find('form .button').click
  sleep(1)
end

Then(/^I should see orders from: "(.*?)"$/) do |emails|
  emails.split(' ').each do |email|
    expect(page).to have_css('td', text: email)
  end
end

But(/^I shouldn't see orders from: "(.*?)"$/) do |emails|
  emails.split(' ').each do |email|
    expect(page).not_to have_css('td', text: email)
  end
end

And(/^I change status on order "(.*?)" to "(.*?)"$/) do |client_email, status|
  order = Order.all.select{|order| order.client_email == client_email}.first
  visit "/partner/#/orders/#{order.id}/edit"
  page.find("select").find('option', text: status).select_option
  page.find('form .button').click
  sleep(1)
end

Then(/^order from "(.*?)" has status "(.*?)"$/) do |client_email, status|
  order = Order.all.select{|order| order.client_email == client_email}.first
  expect(order.status).to eq(status)
end