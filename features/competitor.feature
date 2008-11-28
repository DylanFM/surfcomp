Feature: Competitors are competitors
  In order to run a competition
  As a competition organiser
  I want entrants to be competitors and identified
  
  Scenario: A competitor is created
    Given the entrant has a name
    When the entrant becomes a competitor
    Then the entrant should be a competitor