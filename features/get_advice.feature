Feature: Involve a circle in a decision
  In order to make the best possible decision
  As a proposer
  I want to leverage the wisdom of my circle

  Scenario Outline:
    Given a proposition set up with <protocol> about a subject
    When there are <yes> votes and <no> votes on the subject
    Then the outcome is to <adopt or drop> the proposition about the subject

  Examples:
    | yes | no | protocol  | adopt or drop |
    | 0   | 0  | Unanimity | drop          |
    | 1   | 0  | Unanimity | adopt         |
    | 2   | 1  | Unanimity | drop          |
    | 2   | 1  | Majority  | adopt         |
    | 2   | 2  | Majority  | drop          |