#Creating an order
Given(/^I know how many orders I have$/) do
  @number_of_orders_in_db = Order.count
  puts @number_of_orders_in_db
end
When(/^I create a new order$/) do
  create :order
end
Then(/^I should have (\d+) additional order$/) do |number_additional|
  Order.count.should == @number_of_orders_in_db + number_additional.to_i
end

#Reading the order
Given(/^I have an order for "([^"]*)"$/) do |name|
  create :order, :name => name
  @the_name = name
end

When(/^I read that order from the database$/) do
  @the_order = Order.find_by_name(@the_name)
end
Then(/^I should see that the name is "([^"]*)"$/) do |name|
  @the_order.name.should == name
end

#update
When(/^I update the name to "([^"]*)"$/) do |name|
  order = Order.find_by_name(@the_name)
  order.name = name
  order.save
end
Then(/^I should not have an order for "([^"]*)"$/) do |name|
  Order.find_by_name(name).should be_nil
end
When(/^I should have an order for "([^"]*)"$/) do |name|
  order = Order.find_by_name(name)
  order.name.should == name
end
When(/^I delete that order$/) do
  order = Order.find_by_name(@the_name)
  order.delete
end