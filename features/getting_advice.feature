Feature: Involve a circle in a decision
  In order to make the best possible decision
  As a proposer
  I can leverage the wisdom of a circle

  Scenario Outline: Votes on a proposal
    Given a proposition set up with <protocol> about a subject
    And the following available choices on the subject
      |Choices|
      |yes    |
      |no     |
    When there are <yes> votes and <no> votes on the subject
    Then the outcome of the proposition about the subject is "<outcome>"

  Examples:
    | yes | no | protocol  | outcome       |
    | 0   | 0  | Unanimity | No unanimity  |
    | 1   | 0  | Unanimity | yes           |
    | 2   | 1  | Unanimity | No unanimity  |
    | 2   | 1  | Majority  | yes           |
    | 2   | 2  | Majority  | No majority   |
   
  Scenario: Vote on a proposal among custom choices
    Given a proposition set up with Majority about a subject
    And the following available choices on the subject
      |Choices         |
      |take this option|
      |prefer this one |
    When there are the following votes on the subject
      |Vote            |Number|
      |take this option|  2   |
      |prefer this one |  3   |
    Then the outcome of the proposition about the subject is "prefer this one"
      