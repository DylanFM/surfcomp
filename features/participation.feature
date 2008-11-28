Feature: Competition has competitors
  In order to run a competition
  As a competition organiser
  I want to add the competitors to their division

  Scenario: Surf competition begins
    Given there are entrants
    When we begin the competition
    Then all entrants should be competing
    And all entrants should be competitors

      
    