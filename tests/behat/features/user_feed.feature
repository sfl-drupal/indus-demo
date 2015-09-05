@api @user_feed
Feature: Test the integration and functionality of the user feed. Its no possible to test the JavaScript/AJAX functionality because Goutte browser emulator don't support JavaScript, so this test is only HTTP calls.

  @admin
  Scenario: An administrator configure the feed and see some contents
    Given I am logged in as a user with the "Administrateur" role
    Then I should see the link "Flash actus" in the "Header" region
    Then I visit "/user"
    Then I should see the link "Mes alertes" in the "Content" region
    When I click "Mes alertes" in the "Content" region
    Then I should see 1 "#edit-field-thematic-und" element
    And I fill in "edit-field-thematic-und" with "17"
    And I press the "Enregistrer" button
    And I go to "user/feed"
    Then I should see 5 "div.node--teaser-mini-feed" element
    Then I visit "/user"
    Then I should see the link "Mes alertes" in the "Content" region
    When I click "Mes alertes" in the "Content" region
    Then I should see 1 "#edit-field-thematic-und" element
    And I fill in "edit-field-thematic-und" with "17"
    And I press the "Enregistrer" button
    And I go to "user/feed"
    Then I should see 5 "div.node--teaser-mini-feed" element

  @editor
  Scenario: An editor configure the feed and see some contents
    Given I am logged in as a user with the "Éditeur" role
    Then I should see the link "Flash actus" in the "Header" region
    Then I visit "/user"
    Then I should see the link "Mes alertes" in the "Content" region
    When I click "Mes alertes" in the "Content" region
    Then I should see 1 "#edit-field-thematic-und" element
    And I fill in "edit-field-thematic-und" with "17"
    And I press the "Enregistrer" button
    And I go to "user/feed"
    Then I should see 5 "div.node--teaser-mini-feed" element
    Then I visit "/user"
    Then I should see the link "Mes alertes" in the "Content" region
    When I click "Mes alertes" in the "Content" region
    Then I should see 1 "#edit-field-thematic-und" element
    And I fill in "edit-field-thematic-und" with "17"
    And I press the "Enregistrer" button
    And I go to "user/feed"
    Then I should see 5 "div.node--teaser-mini-feed" element

  @anonymous
  @User Feed user with the role utilisateur anonyme
  Scenario: Not logged user should see a simple message
    Given I am on the homepage
    Then I should not see the link "Flash actus" in the "Header" region
    And I go to "user/feed"
    Then I should see "Vous devez être connecté pour accéder à votre flux d'informations"
