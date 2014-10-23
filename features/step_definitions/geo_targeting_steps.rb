Given(/^a partner from "(.*?)" with domain: "(.*?)", email: "(.*?)"$/) do |city_name, subdomain, email|
  city = FactoryGirl.create :city, name: city_name, subdomain: subdomain, geo_name: city_name
  FactoryGirl.create :partner, email: email, password: 'password', city: city
end

Given(/^I am in "(.*?)"$/) do |city_name|
  city = City.where(name: city_name).first
  partner = User::Partner.where(city: city).first
  MainFacade.any_instance.stub(:city).and_return(city_name)
  MainFacade.any_instance.stub(:partner).and_return(partner)
end

Then(/^I should see modal windows with text "(.*?)"$/) do |text|
  expect(page).to have_css('.modal .header',text: text)
end

Then(/^I should be redirected to subdomain "(.*?)"$/) do |sub|
  uri = URI.parse(current_url)
  expect(uri.host).to match(/^#{sub}./)
end

And(/^I select city "(.*?)"$/) do |value|
  page.find(".city").click
  page.find('.item', text: value).click

end