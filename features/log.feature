Feature: Log
  In order to free disk space
  As a developer
  I want the log script to clear logs

  Scenario: User runs $ mage:clean_log
    Given an app
    When I execute mage:clean_log
    Then the Magento log should be executed
