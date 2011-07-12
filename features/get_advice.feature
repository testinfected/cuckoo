Feature: Involve a circle
  In order to make the best decision
  As a proposer
  I want to leverage the wisdom of my circle

  Scenario: suggest to drop proposition when there is no vote
    Given a proposition about "tonight's dinner"
    When there is no vote on "tonight's dinner"
    Then the outcome is to drop "tonight's dinner"

  Scenario: suggest to adopt proposition when there are only yes votes
    Given a proposition about "tomorrow's dinner"
    When someone votes yes on "tomorrow's dinner"
    Then the outcome is to adopt "tomorrow's dinner"


