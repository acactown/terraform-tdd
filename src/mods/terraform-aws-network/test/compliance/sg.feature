Feature: Check public selected ports

    Scenario: Only selected ports should be publicly open
        Given I have AWS Security Group defined
        When it has ingress
        Then it must have ingress
        Then it must only have tcp protocol and port 80 for 0.0.0.0/0
