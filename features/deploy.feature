Feature: Deployment
  In order to deploy Magento
  As a developer
  I want my release to be uploaded and symlinks to shared resources created

  Scenario: User runs $ cap deploy
    Given an app
    When I execute deploy
    Then the local.xml file should be written to shared

  Scenario: User runs $ cap deploy with missing config
    Given an app
    When I have deploy.rb with missing config
    Then [error] should be returned

  Scenario: User runs $ cap mage:disable
    Given an app
    When I execute deploy
    And I execute mage:disable
    Then the maintenance.flag file should be written to current

  Scenario: User runs $ cap mage:enable
    Given an app
    When I execute deploy
    And I execute mage:enable
    Then the maintenance.flag file should be removed from current
