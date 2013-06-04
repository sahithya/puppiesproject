Feature: Example of testing AJAX
  Scenario: Changing days updates schedule
    Given I am on the GWT DynaTable page
    When I select the schedule for Monday
    Then I should see that Inman Mendez has a class at Mon 9:45-10:35
    And I should see that Omar Smith has a class at Mon 4:30-5:20
    When I select the schedule for Tuesday
    Then I should see that Inman Mendez has a class at Tues 2:15-3:05
    And I should see that Eddie Edelstein has a class at Tues 12:15-1:05
    And I should see that Carlos Needler has a class at Tues 8:00-8:50