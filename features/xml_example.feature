Feature: Example of using xml in your cukes
  Scenario: Lookup contact information from XML
    Given I have a contact list with following
      | name   | phone     |
      | Cheezy | 234-5677  |
      | Sneezy | 890-1233  |
      | Wheezy | 456-7899 |
    When I lookup the phone number of "Wheezy"
    Then I should get the phone number "456-7899"
