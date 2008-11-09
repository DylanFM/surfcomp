Feature: Competition has competitors
  In order to have a surfing competition
  Competitors should be added to their divisions

  Scenario: Surf competition begins
    Given there are people who have entered the competition
    When we begin the surf competition
    Then all entrants should be competing
