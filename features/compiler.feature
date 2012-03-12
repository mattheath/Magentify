Feature: Compiler
  In order to make Magento fast
  As a developer
  I want the compiler to be run during finalize_deploy

  Scenario: User runs $ cap deploy with compile true
    Given an app
    When I execute deploy with --set compile=true
    Then the Magento compiler should be executed

  Scenario: User runs $ cap deploy with compile false
    Given an app
    When I execute deploy with --set compile=false
    Then the Magento compiler should not be executed

  Scenario: User enables compiler
    Given an app
    When I execute mage:enable_compiler
    Then the Magento compiler should be executed with enable option

  Scenario: User disables compiler
    Given an app
    When I execute mage:disable_compiler
    Then the Magento compiler should be executed with disable option
