Feature: Sharing proposals with a circle
  In order to involve a circle in a decision
  As a proposer
  I can share a proposal with a circle

  Scenario: Guest accesses voting page using guest pass
    Given a proposal about tonight's dinner
    When I share the proposal about tonight's dinner
    And a guest uses tonight's dinner guest pass
    # todo: probably better to vote then check vote results
    Then the guest sees the voting page on tonight's dinner
