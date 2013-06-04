Feature: Adopting puppies

  Background:
    Given I am on the puppy adoption site


  Scenario Outline: Adopting one puppy

    When  I click on View Details button
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I enter  "<name>" into the name field
    And I enter "<address>" into the address field
    And I enter "<email>" into the email field
    And I select "<pay_type>" from the pay type dropdown
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!" message

  Examples:
    | name   | address           | email              | pay_type       |
    | Cheezy | 123 Main Street   | cheezy@example.com | Credit card    |
    | Sneezy | 555 Easy Money Dr | sneezy@example.com | Purchase order |
    | Wheezy | 777 Sniffle Dr    | wheezy@example.com | Check          |

  Scenario:  Adopting two puppies
    When  I click on View Details button for "Brook"
    And I click the Adopt Me button
    And I click the Adopt Another Puppy
    When  I click on View Details button for "Hanna"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I enter  "Cheezy" into the name field
    And I enter "123 Main Street" into the address field
    And I enter "cheezy@example.com" into the email field
    And I select "Credit card" from the pay type dropdown
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!" message

  Scenario: Verify one adoption
    When  I click on View Details button for "Brook"
    And I click the Adopt Me button
    And I verify that the puppy name equals "Brook" in line item 1
    And I verify that the cost of the puppy equals "$34.95" in line item 1
    And I verify that the total cost of my order equals "$34.95"
    And I click the Complete the Adoption button
    And I enter  "Cheezy" into the name field
    And I enter "123 Main Street" into the address field
    And I enter "cheezy@example.com" into the email field
    And I select "Credit card" from the pay type dropdown
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!" message


  Scenario: Verify two adoptions
    When  I click on View Details button for "Brook"
    And I click the Adopt Me button
    And I verify that the puppy name equals "Brook" in line item 1
    And I verify that the cost of the puppy equals "$34.95" in line item 1
    And I verify that the total cost of my order equals "$34.95"
    And I click the Adopt Another Puppy
    When  I click on View Details button for "Hanna"
    And I click the Adopt Me button
    And I verify that the puppy name equals "Hanna" in line item 2
    And I verify that the cost of the puppy equals "$22.99" in line item 2
    And I verify that the total cost of my order equals "$57.94"
    And I click the Complete the Adoption button
    And I enter  "Cheezy" into the name field
    And I enter "123 Main Street" into the address field
    And I enter "cheezy@example.com" into the email field
    And I select "Credit card" from the pay type dropdown
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!" message


  Scenario: Adopting a puppy using a table
    When I click on View Details button for "Brook"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I checkout with:
      | name   | address         | email              | pay_type    |
      | Cheezy | 123 Main Street | cheezy@example.com | Credit card |

    Then I should see "Thank you for adopting a puppy!" message

  Scenario: Adopting a puppy using default data

    When I click on View Details button for "Brook"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I checkout
    Then I should see "Thank you for adopting a puppy!" message


  Scenario: Adopting a puppy using partial default data

    When I click on View Details button for "Brook"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I checkout using a Credit Card
    Then I should see "Thank you for adopting a puppy!" message


  Scenario: Rule Them All
    When I adopt a puppy
    Then I should see "Thank you for adopting a puppy!" message

  Scenario: Thank you message should appear after adoption is completed
    When I complete the adoption of a puppy
    Then I should see "Thank you for adopting a puppy!" message


  Scenario: Name is required when checking out
    When I attempt to checkout without a name
    Then I should see "Name can't be blank"


  Scenario: Address is required when checking out
    When I attempt to checkout without an address
    Then I should see "Address can't be blank"

  Scenario: Processing a puppy for Cheezy
    Given I have a pending order for Cheezy
    When I process that order
    Then I should see "Please thank Cheezy for the order!" message

