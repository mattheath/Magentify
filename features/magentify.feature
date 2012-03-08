Feature: Magentify
  In order to deploy Magento with Capistrano
  As a developer
  I want my project to be configured to use Magento specific deploy tasks

  Scenario: User runs $ magentify .
    Given an app
    When I execute magentify .
    Then deploy.rb should load mage.rb

  Scenario: User runs $ cap -T
    Given an app
    When I execute cap -T
    Then cap -T should list mage
