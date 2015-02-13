Given /^a service "(.*?)"$/ do |name|
  Service.create(name: name)
end


Then /^Order without service should be exist$/ do
  expect(Order.first.service_id).to eq(nil)
end

Then /^Order with service: "(.*?)" should be exist$/ do |service|
  expect(Order.first.service_id).to eq(Service.find_by(name: service).id)
end


And(/^I fill in "(.*?)" as "(.*?)" within "(.*?)"$/) do |field, name, form|
  within form do
    page.find("[name='#{field}']").click
    sleep 1
    page.find("[name='#{field}']").native.send_keys(name)
    # page.fill_in field, with: name
  end
end


And(/^I submit the "(.*?)"$/) do  |form|
  within form do
    find(".submit_button").click
  end
  sleep(1)
end

And /^I click on button "(.*?)" on the slider: "(.*?)"$/ do |button, slider|
  within ".#{slider}" do
    find(".#{button}").click
  end
end
