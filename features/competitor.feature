Feature: Competitors are competitors
  In order for there to be competitors
  Competitors should be competitors and be identified
  
  Scenario: A competitor is created
    Given the person has a name
    When the competitor is created
    Then the competitor should be a competitor
    And the competitor should be the person