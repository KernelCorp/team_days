Given(/^a service with name "(.*?)"$/) do |name|
  Service.create name: name
end

And(/^a services box "(.*?)" with services: "(.*?)", "(.*?)"$/) do |name, service_one, service_two|
  box = ServicesBox.create name: name
  box.services << Service.where(name: service_one).first
  box.services << Service.where(name: service_two).first
  box.save
end

And(/^a partner from "(.*?)" with email: "(.*?)"$/) do |town, email|
  city = FactoryGirl.create :city, name: town
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

And(/^I click on "(.*?)"$/) do |elem|
  page.find('a', text: elem)
end

And(/^I disable service "(.*?)"$/) do |service_name|
  service = Service.find_by name: service_name
  User::Partner.first.available_services.where(service: service).first.update_attribute :is_active, false
end

Then(/^I should see service "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

But(/^I shouldn't see service "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
