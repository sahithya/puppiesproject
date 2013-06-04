Feature: Examples of using the data in your cukes

  Scenario: Creating an order
    Given I know how many orders I have
    When I create a new order
    Then I should have 1 additional order

  Scenario: Reading an order
    Given I have an order for "James Dean"
    When I read that order from the database
    Then I should see that the name is "James Dean"

  Scenario: Updating an order
    Given I have an order for "Marty Moose"
    When I update the name to "Donald Duck"
    Then I should not have an order for "Marty Moose"
    And I should have an order for "Donald Duck"

  Scenario:  Deleting an order
    Given I have an order for "Elvis"
    When I delete that order
    Then I should not have an order for "Elvis"