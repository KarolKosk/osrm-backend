@routing @options
Feature: Command line options: invalid options

    Background:
        Given the profile "testbot"

    Scenario: Non-existing option
        When I run "osrm-routed --fly-me-to-the-moon"
        Then stdout should be empty
        And stderr should contain "exception"
        And stderr should contain "fly-me-to-the-moon"
        And it should exit with code 255

    Scenario: Missing file
        When I run "osrm-routed over-the-rainbow.osrm"
        Then stdout should contain "over-the-rainbow.osrm"
        And stderr should contain "exception"
        And stderr should contain "does not exist"
        And it should exit with code 255
        