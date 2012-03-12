Feature: Indexer
  In order to make Magento fast
  As a developer
  I want the indexer to run to fill flat tables

  Scenario: User runs $ mage:indexer
    Given an app
    When I execute mage:indexer
    Then the Magento indexer should be executed
