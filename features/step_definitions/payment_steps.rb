And(/^a payment for order from "(.*?)" created_at: "(.*?)"$/) do |client_email, created_at|
  order = Order.all.select{|order| order.client_email==client_email}.first
  order.payments.build(sum: 100).save
  order.payments.last.update_attribute :created_at, created_at
end

And(/^I select filter by "(.*?)", "(.*?)"$/) do |filter, value|
  within ".#{filter}" do
    find('.input').set value
  end
end

Then(/^I should see payment from "(.*?)"$/) do |client_email|
  order = Order.all.select{|order| order.client_email==client_email}.first
  expect(page).to have_css('td', text: order.id)
end


Then(/^I shouldn't see payment from "(.*?)"$/) do |client_email|
  order = Order.all.select{|order| order.client_email==client_email}.first
  expect(page).not_to have_css('td', text: order)
end