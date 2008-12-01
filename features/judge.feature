Feature: Judges score competitors in heats
  In order to rank competitors
  As a competition organiser
  I want judges to score competitors so they can be ranked
  
  Scenario: Heat has judges
    Given a heat is going to be run
    When the heat is run
    Then there should be 3 judges for the heat
    
  Scenario: Competitor catches a wave
    Given the heat is run
    When a competitor catches a wave
    Then the competitors wave count should increase by 1
    And each judge should submit a score for that wave
  
  Scenario: Heat finishes
    Given the heat is run
    When the heat finishes
    Then each competitor should have the same amount of scores
  