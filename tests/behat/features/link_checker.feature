@api @link_checker @70582

Feature: Les liens brisés doivent être détectés et apparaitre dans un rapport administrateur.

  Scenario: Le module Link Checker doit être activé par défaut lors d'une nouvelle installation
    Given I run drush "pm-enable" "linkchecker -y"
    Then drush output should contain "linkchecker is already enabled."

  @local
  Scenario: Si je créé un contenu avec un lien brisé dans la zone Body, le lien doit apparaitre dans les rapports
    Given I am logged in as a user with the "Administrateur" role
    When I visit "node/add/page"
    Then I fill in "title" with "Link Checker Test 23"
    And I fill in "body[und][0][value]" with "<p>this is a <a href=\"http://philippemouchel.fr/liirs\">broken link</a></p>"
    And I press the "Enregistrer" button
    #Then I visit "admin/config/content/linkchecker"
    #And I press "Clear link data and analyze content for links"
    Then I run cron
    Then I visit "admin/reports/linkchecker"
    Then I should see "http://philippemouchel.fr/liirs" in the "Link_checker_report" region

  Scenario: Les liens valides dans les contenus ne doivent pas apparaitre dans les rapports de liens brisés
    Given I am logged in as a user with the "Administrateur" role
    When I visit "node/add/page"
    Then print current URL
    And I fill in "title" with "Link Checker Test 02"
    And I fill in "body[und][0][value]" with "<p>this is a <a href=\"http://philippemouchel.fr/loisirs\">correct link</a></p>"
    And I press the "Enregistrer" button
    Then I visit "admin/reports/linkchecker"
    And I should not see "http://philippemouchel.fr/loisirs" in the "Link_checker_report" region

  @wip @redirect
  Scenario: Le module Redirect doit être activé par défaut lors d'une nouvelle installation
    Given I run drush "pm-enable" "redirect -y"
    Then drush output should contain "redirect is already enabled."

  @wip @redirect
  Scenario: Quand l'alias d'un contenu est modifié, une redirection doit être automatiquement faite depuis l'ancien alias
    Given I am logged in as a user with the "Administrateur" role
    When I visit "node/add/page"
    Then print current URL
    And I fill in "title" with "node1"
    And I fill in "body[und][0][value]" with "<p>this is node1</p>"
    And I press the "Enregistrer" button
    Then I visit "node1"
    When I click "Modifier"
    And  I uncheck the box "path[pathauto]"
    And I fill in "path[alias]" with "newurl"
    And I press the "Enregistrer" button
    Then I visit "node1"
    Then I should see "node1"
