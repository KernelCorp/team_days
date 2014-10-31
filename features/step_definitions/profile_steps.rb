And(/^I fill up input "(.*?)" in the form "(.*?) as "(.*?)"$/) do |name, form, value|
  within "form" do
    fill_in name, with: value
  end
end

And(/^I fill up with keyboard input "(.*?)" in the form "(.*?) as "(.*?)"$/) do |name, form, value|
  input = page.all("form")[0].find( :field, name )
  input.click()

  begin
    input.native.send_keys value
  rescue
    fill_in name, with: value
  end
end

And(/^I click to "(.*?)", "(.*?)"$/) do |elem, text|
  page.find(elem, text: text).click
  sleep(1)
end


And(/^I click to edit profile/) do
  page.find('.edit_profile').click
end

And(/^I submit the form "(.*?)"$/) do  |form|
  within "##{form}" do
    find(".button").click
  end
  sleep(1)
end

And(/^My email is "(.*?)"$/) do |email|
  expect(User::Partner.first.email).to eq(email)
end


