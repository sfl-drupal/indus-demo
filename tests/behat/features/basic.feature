@api

Feature: Drush tests

@73743
  Scenario: Cache flush must process correctly
    Given I run drush "drush cc all"
    Then drush output should contain "'all' cache was cleared."
