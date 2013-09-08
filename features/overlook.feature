Feature: view pages

  Scenario: Home page
    Given I am on "the home page"
    Then I should see "All work and no play makes Jack a dull boy"

  Scenario: Get ipsum
    When I go to "/1"
    Then I should see "All work and no play makes Jack a dull boy"
