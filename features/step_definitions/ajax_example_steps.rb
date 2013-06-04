Given(/^I am on the GWT DynaTable page$/) do
  visit DynaTablePage
end
When(/^I select the schedule for (.+)$/) do |day|
  on(DynaTablePage).select_schedule_for day
end
Then(/^I should see that (.+) has a class at (.+)$/) do |professor, schedule|
  on(DynaTablePage).class_schedule_for(professor).should include schedule
end