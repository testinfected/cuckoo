Feature: Involve a circle
  In order to make the best decision
  As a proposer
  I want to leverage the wisdom of my circle

  Scenario: drop it when there is no vote
    Given a proposition
    When there is no vote
    Then the outcome is to drop the proposition


