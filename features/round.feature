Feature: Rounds have heats and they are run
  In order to have a surfing competition
  Competitors should be sorted into heats and the heats should be run

  Scenario: Make a new round
    Given there is a division containing competitors
    When a round is created
    Then all competitors should be sorted into heats
    And the heats should be of an acceptable size
    And the round is coming up
    And the round has heats which are coming up
    And there should not be a current heat
    
  Scenario: We run the heats
    Given a round has started
    Then the round is in progress
    And the heats have been run
    
  Scenario: The round is completed
    Given a round has started
    When the round has finished
    Then the round is finished