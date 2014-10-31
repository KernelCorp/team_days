And(/^I click button "(.*?)"$/) do |text|
  page.find('button', text: text).click
end

And(/^I select services box "(.*?)"$/) do |name|
  page.find('option', text: name).click
  page.find('.services_boxes_field .ra-multiselect-item-add').click
  # sleep(1)
  # ServicesBox.find_by(name: name).services.each do |service|
  #   page.find('.available_services_field .icon-white.icon-chevron-down').click
  #   sleep(1)
  #   page.find('.available_services_field .nav.nav-tabs li a', text: service).click
  #   page.find('#user_partner_available_services_attributes_0_is_active').click
  # end
end

Then(/^I should see in table service "(.*?)"$/) do |name|
  expect(page).to have_css('td a', text: name)
end

Then(/^I should see banned in table service "(.*?)"$/) do |name|
  expect(page).to have_css('.error td a', text: name)
end

And(/^I deselect service "(.*?)"$/) do |name|
  page.find('.available_services_field .icon-white.icon-chevron-right').click
  sleep(1)
  page.find('.available_services_field .nav.nav-tabs li a', text: name).click
  page.all('.available_services_field .controls input[type=checkbox]')[1].click
end

And(/^I click to submit$/) do
  page.find('.btn-primary[type=submit]', text: "Save").click
  sleep(1)
end

And(/^I click to edit partner: "(.*?)"$/) do |arg1|
  page.find('.links .edit_member_link a').click
  sleep(1)
end


And(/^I signed in as admin$/) do
  User::Admin.create email: 'admin@example.com', password: 'password'
  visit '/admin'
  within '#new_admin' do
    fill_in 'admin[email]', with: 'admin@example.com'
    fill_in 'admin[password]', with: 'password'
  end
  find('[type=submit]').click
  sleep(1)
end