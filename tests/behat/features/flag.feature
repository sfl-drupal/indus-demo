@api @flag

Feature: Test Flag features: recommand, record

Scenario: The recommand, bookmark and share actions are available on article teasers
  Given I am logged in as a user with the "Administrateur" role
  And I am on the homepage
  Then I should see the link "Recommander" in the "Article" region
  And I should see the link "Sauvegarder" in the "Article" region

@share @66093
Scenario: A user can recommand a news
  Given I am logged in as a user with the "Editeur" role
  And I am on the homepage
  Then I should see the text "Contrat d'espace étudiant en ligne en France pour Savoir-faire Linux"
  When I click "Recommander" in the "Main article teaser" region
  # And I wait for AJAX to finish
  Then I should see the link "Ne plus recommander" in the "Main article teaser" region

@share @70377
Scenario: A user can bookmark a news
  Given I am logged in as a user with the "Editeur" role
  And I am on the homepage
  Then I should see the text "Contrat d'espace étudiant en ligne en France pour Savoir-faire Linux"
  When I click "Sauvegarder" in the "Main article teaser" region
  # And I wait for AJAX to finish
  Then I should see the link "Supprimer" in the "Main article teaser" region
