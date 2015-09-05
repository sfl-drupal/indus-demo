@api @sharer_toolbar

Feature: Test Flag features: recommand, record

  @share @66093 @70377 @66075
  Scenario: The recommand, bookmark and share actions are available on article teasers
    Given I am logged in as a user with the "Administrateur" role
    And I am on the homepage
    Then I should see the text "Partager" in the "Article" region
    And I should see the link "Partager sur Facebook" in the "Article" region
    And I should see the link "Partager sur Twitter" in the "Article" region
    And I should see the link "Partager sur LinkedIn" in the "Article" region
    And I should see the link "Partager par email" in the "Article" region

  @share @66075
  Scenario: A user can share a news
    Given I am an anonymous user
    And I am on the homepage
    Then I should see the text "Partager" in the "Article" region
    And I should see the link "Partager sur Facebook" in the "Article" region
    And I should see the link "Partager sur Twitter" in the "Article" region
    And I should see the link "Partager sur LinkedIn" in the "Article" region
    And I should see the link "Partager par email" in the "Article" region


  @share @66075
  Scenario: A user cannot administer the sharer toolbar
    Given I am an anonymous user
    And I go to "admin/config/services/social-sharer-toolbar"
    Then I should get a "403" HTTP response
