Feature: Setup
  In order to deploy Magento
  As a developer
  I want the correct folder structure created on the remote server

  Scenario: User runs $ cap deploy:setup
    Given an app
    When I execute deploy:setup
    Then the shared folder structure should be created
