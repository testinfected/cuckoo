Feature: Involve a circle in a decision
  In order to make the best possible decision
  As a proposer
  I want to leverage the wisdom of my circle

  Scenario: Drop proposition when there is no vote
    Given a proposition about a subject
    When there is no vote on the subject
    Then the outcome is to drop the proposition about the subject

  Scenario: Adopt proposition when there are only yes votes
    Given a proposition about a subject
    When someone votes yes on the subject
    Then the outcome is to adopt the proposition about the subject

  Scenario: Drop proposition when there is a no vote
    Given a proposition about a subject
    When someone votes yes on the subject
    And someone votes no on the subject
    Then the outcome is to drop the proposition about the subject

