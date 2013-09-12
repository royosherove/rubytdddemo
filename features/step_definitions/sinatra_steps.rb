
When(/^I go to the main page$/) do
  visit "/"
end

Then(/^I should see the default greeting$/) do
  page.should have_content "Hello World"
end
