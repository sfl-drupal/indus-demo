@api @fluxrss
Feature: Vérifie que l'aggrégation des flux RSS provenant notamment de sites de département fonctionne.

  Scenario: Tout le monde peut voir les annonces des formations sur la page d'accueil.
    Given I am on the homepage
    Then I should see 5 ".pane-aggregator__item" element
    Then I should see 5 ".aggregator-nugget__date" element
    Then I should see 5 ".aggregator-nugget__title" element
