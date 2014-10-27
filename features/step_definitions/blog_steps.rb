
Given(/^a category "(.*?)"$/) do |name|
  FactoryGirl.create :category, name: name
end

And(/^a post in the category "(.*?)" with title "(.*?)" with tags: "(.*?)"$/) do |category_name, post_name, tags_string|
  category = Blog::Category.find_by name: category_name
  post = FactoryGirl.create :post, name: post_name, category: category
  tags_string.split(',').each do |tag|
    new_tag = Blog::Tag.where(name: tag).first
    if new_tag.nil?
      new_tag = FactoryGirl.create :tag, name: tag
    end
    post.tags << new_tag
  end
  post.save
end

And(/^I select category "(.*?)"$/) do |name|
  page.find('a', text: name).click
  sleep(1)
end



Then(/^I should see post with title "(.*?)"$/) do |name|
  expect(page).to have_css('.title', text: name)
end

Then(/^I shouldn't see post with title "(.*?)"$/) do |name|
  expect(page).not_to have_css('.title', text: name)
end

When(/^I visit post with title "(.*?)"$/) do |name|
  post = Blog::Post.find_by name: name
  visit post_path(post)
end


And(/^I click on tag "(.*?)"$/) do |name|
  page.find('a', text: name).click
  sleep(1)
end

Given(/^an email "(.*?)" has subscription on new posts in category "(.*?)"$/) do |email, category_name|
  category = Blog::Category.find_by name: category_name
  subscription = FactoryGirl.create :subscription, email: email
  subscription.categories << category
  subscription.save
end

When(/^a new post in category "(.*?)" was created$/) do |category_name|
  category = Blog::Category.find_by name: category_name
  category.posts.create name: "post_#{SecureRandom.hex(5)}"
end
