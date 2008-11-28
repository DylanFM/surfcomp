Feature: Heats have competitors and they are run
  In order to run a competition
  As a competition organiser
  I want to put the competitors in heats

  Scenario: Make a new heat
    Given there are competitors for a heat
    When the heat is made
    Then the heat should contain the competitors
    And the heat should be coming up
  
  Scenario: Add a competitor to a heat
    Given there is a competitor and a heat
    When a competitor is added to the heat
    Then the competitor should be in the heat
    
  Scenario: Start a heat
    Given there is a new heat
    When the heat is started
    Then the heat should be in progress
    
  Scenario: Finish a heat
    Given there is a heat in progress
    When the heat finishes
    Then the heat should be finished
    
  Scenario: A heat exists
    Given there is a heat
    When the heat details are requested
    Then the details should show the time
    And they should show the length
    And they should show the location
    And they should show the competitors
  
  
  
