Given(/^a service with name "(.*?)"$/) do |name|
  Service.create name: name, price: 100
end

And(/^a services box "(.*?)" with services: "(.*?)"$/) do |name, services_str|
  box = ServicesBox.create name: name
  services_str.split(', ').each do |service_name|
    box.services << Service.where(name: service_name).first
  end
  box.save
end

And(/^a partner from "(.*?)" with email: "(.*?)"$/) do |town, email|
  city = FactoryGirl.create :city, name: town, subdomain: 'skol'
  FactoryGirl.create :partner, email: email, password: 'password', city: city
end

And(/^a services box "(.*?)" available for partner "(.*?)"$/) do |sb_name, partner_email|
  service_box = ServicesBox.where(name: sb_name).first
  partner = User::Partner.where(email: partner_email).first
  partner.services_boxes << service_box
  partner.save
end

And(/^I signed in as partner with email "(.*?)"$/) do |email|
  visit '/partner'
  within '#new_partner' do
    fill_in 'partner[email]', with: email
    fill_in 'partner[password]', with: 'password'
  end
  find('[type=submit]').click
  sleep(1)
end

When(/^I go to "(.*?)"$/) do |url|
  visit url
end

When(/^I go to subdomain to "(.*?)"$/) do |url|
  MainController.any_instance.stub(:subdomain) { "skol" }
  visit url
end

And(/^I click on "(.*?)"$/) do |elem|
  page.find('span', text: elem).click
  sleep(2)
end

And(/^I disable service "(.*?)"$/) do |service_name|
  service = Service.find_by name: service_name
  User::Partner.first.available_services.where(service: service).first.update_attribute :is_active, false
end

Then(/^I should see service "(.*?)"$/) do |name|
  expect(page).to have_css('.name', text: name)
end

But(/^I shouldn't see service "(.*?)"$/) do |name|
  expect(page).not_to have_css('.name', text: name)
end


Then(/^I should see the service "(.*?)"$/) do |name|
  expect(page).to have_css('.item .name', text: name)
end

But(/^I shouldn't the service "(.*?)"$/) do |name|
  expect(page).not_to have_css('.item .name', text: name)
end

And(/^I select the service "(.*?)"$/) do |name|
  page.find('.item .name', text: name).click
  sleep(1)
end

Then(/^I should see "(.*?)", "(.*?)"$/) do |css, text|
  expect(page).to have_css(css, text: text)
end

And(/^I check checkbox$/) do
  page.find('.checkbox').click
end

Then(/^I should see be redirected to paid system$/) do
  current_path.should match(/^\/payments\//)
end