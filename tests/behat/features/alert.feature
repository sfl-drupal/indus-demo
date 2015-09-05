@api @playlist

Feature: display published Alert

@73743
  Scenario:  create a published  alert and test if it appear in the list of alerts
    Given I am logged in as a user with the "Administrateur" role
    When I visit "node/add/alert"
    Then I fill in "title" with "test alert"
    And I fill in "body[und][0][value]" with "test73743"
    And I fill in "field_alert_status[und]" with "avis"
    And I check the box "status"
    And I press the "Enregistrer" button
    And I am on the homepage
    Then I should see "test73743" in the "Alerts list" region

  Scenario:  unpublish  alert and verify that it doesn't appear in the list of alerts
    Given I am logged in as a user with the "Administrateur" role
    When I visit "node/add/alert"
    Then I fill in "title" with "test alert2"
    And I fill in "body[und][0][value]" with "test73743"
    And I fill in "field_alert_status[und]" with "avis"
    And I uncheck the box "status"
    And I press the "Enregistrer" button
    And I am on the homepage
    Then I should not see "test73743" in the "Alerts list" region
