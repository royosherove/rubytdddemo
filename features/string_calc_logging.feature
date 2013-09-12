Feature: String Calculator Logging
    In order to easily debug the results the a user is getting
    as developers
    we want to have logging enabled for the string calculator
    we will only use HAND WRITTEN mocks (no framework)

	Background: A String Calculator has a Logger
    Scenario: Adding a number
        When the string calculator add method is called with input  "1,2"
        Then slow logger should be notified with "got 3"