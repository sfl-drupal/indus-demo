@api @concours_etudiants

Feature: Teste la gestion des Concours Étudiants

  Scenario: En tant qu'éditeur, je peux créer un contenu de type Concours Étudiant
    Given I am logged in as a user with the "Editeur" role
    When I go to "node/add/call-for-proposal"
    Then I should get a "200" HTTP response

  Scenario: En tant qu'utilisateur non connecté, je dois pouvoir accéder aux Concours Étudiants
    Given I am an anonymous user
    When I am on the homepage
    And I click "Concours étudiants"
    Then I should see 2 ".node--call-for-proposal--teaser-detail" elements


  Scenario: En tant qu'utilisateur non connecté, je dois pouvoir accéder à la page de liste des Concours Étudiants
    Given I am an anonymous user
    When I go to "concours-etudiants"
    Then I should get a "200" HTTP response
    Then I should see 2 ".article-nugget" elements
