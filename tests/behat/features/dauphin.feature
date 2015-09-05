@api @dauphin


Feature: Configuration tests for Espace Étudiant (MyDauphine)

  Scenario: The site name must be properly set
    Given I am logged in as a user with the "Administrateur" role
    When I am on "admin/config/system/site-information"
    Then the "edit-site-name" field should contain "MyDauphine"
    And the "edit-site-slogan" field should contain "Bienvenue sur le nouvel espace Étudiant"

