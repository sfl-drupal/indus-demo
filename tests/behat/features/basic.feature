@api

Feature: Drush tests

@status
  Scenario: Cache flush must process correctly
    Given I run drush "status"
    Then drush output should contain "Drupal version                  :  7.43"

@clear_cache
  Scenario: Cache flush must process correctly
    Given I run drush cc all
    Then drush output should contain "'all' cache was cleared."
