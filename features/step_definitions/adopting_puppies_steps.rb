Given(/^I am on the puppy adoption site$/) do
  visit HomePage
end

When(/^I click on View Details button$/) do
  @browser.button(:value => 'View Details').click
end

When(/^I click the Adopt Me button$/) do
  on(DetailsPage).add_to_cart

end

When(/^I click the Complete the Adoption button$/) do
  on(ShoppingCartPage).proceed_to_checkout

end

When(/^I enter  "([^"]*)" into the name field$/) do |name|
  on(CheckoutPage).name = name
end

When(/^I enter "([^"]*)" into the address field$/) do |address|
  on(CheckoutPage).address = address
end

When(/^I enter "([^"]*)" into the email field$/) do |email|
  on(CheckoutPage).email = email
end

When(/^I select "([^"]*)" from the pay type dropdown$/) do |pay_type|
  on(CheckoutPage).pay_type = pay_type
end



When(/^I click the Place Order button$/) do
  on(CheckoutPage).place_order
end



When(/^I click the Adopt Another Puppy$/) do
  on(ShoppingCartPage).continue_shopping
end


When(/^I verify that the puppy name equals "([^"]*)" in (line item \d+)$/) do |name, line_item|
  on(ShoppingCartPage).name_for_line_item(line_item).should include name


end
When(/^I verify that the cost of the puppy equals "([^"]*)" in (line item \d+)$/) do |cost, line_item|
  on(ShoppingCartPage).subtotal_for_line_item(line_item).should include cost
end
When(/^I verify that the total cost of my order equals "([^"]*)"$/) do |total|
  on(ShoppingCartPage).cart_total.should == total
end
When(/^I click on View Details button for "([^"]*)" in puppy list$/) do |name|
  on(HomePage).select_puppy_by_name(name)
end
When(/^I click on View Details button for "([^"]*)"$/) do |name|
  on(HomePage).select_puppy(name)
end
When(/^I checkout with:$/) do |table|
  on(CheckoutPage).checkout(table.hashes.first)
end
When(/^I checkout$/) do
  on(CheckoutPage).checkout
end
When(/^I checkout using a Credit Card$/) do
  on(CheckoutPage).checkout('pay_type' => 'Credit card')
end
When(/^I adopt a puppy$/) do
  navigate_all
end
When(/^I complete the adoption of a puppy$/) do
  navigate_all
end

When(/^I attempt to checkout without (?:a|an) (.+)$/) do |value|
  navigate_to(CheckoutPage).checkout(value => '')
end

Then(/^I should see "([^"]*)"$/) do |message|
  on(CheckoutPage).should have_error_message message
end

Then(/^I should see "([^"]*)" message$/) do |message|
  @current_page.text.should include message
end

When(/^I attempt to process puppy of an adoptee$/) do
  on(LandingPage)
  on(LogInPage).log_in
  on(LandingPage).view_orders
  on(OrdersPage).process_order
end
Given(/^I have a pending order for (.+)$/) do |name|
  create :order, :name => name
end
When(/^I process that order$/) do
  visit(LandingPage)
  on(LogInPage).log_in
  on(LandingPage).view_orders
  on(OrdersPage).process_puppy
end