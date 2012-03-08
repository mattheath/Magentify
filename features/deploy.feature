Feature: Deployment
  In order to deploy Magento
  As a developer
  I want my release to be uploaded and symlinks to shared resources created

  Scenario: User runs $ cap deploy
    Given an app
    When I execute deploy
    Then the PEOPLE_LIKE_YOU file should be written to shared

  Scenario: User runs $ cap deploy with missing config
    Given an app
    When I execute deploy with missing config
    Then [error] should be returned