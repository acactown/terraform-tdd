Feature: Check multi-layered network architecture

    Scenario: Ensure a multi-layered network architecture
        Given I have AWS Subnet defined
        When I count them
        Then I expect the result is more than 5
