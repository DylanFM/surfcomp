Feature: Heat results
  In order to rank the competitors within a heat
  As a tabulator
  I want to use the heat's judges' scores
  
  Scenario: Judges submit scores
    Given a heat has finished
    When the heat's judges submit their scores
    Then the scores are reduced to the top 3 per competitor
    And the scores are ready for totaling
    
  Scenario: Each judge's scores are totaled 
    Given the scores are ready for totaling
    When each judge's scores are totaled per competitor
    Then the judges' heat places are calculated
    
  Scenario: Heat placements are calculated
    Given the judges' heat places are calculated
    When each competitor's places per judge are totaled
    Then the ranks of the competitors can be found
    And the ranks of the competitors are from lowest total to the highest
  
  
  
