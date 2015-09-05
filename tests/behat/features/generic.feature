@api @generic

Feature: Generic site features and global health

Scenario: The homepage must load properly
  Given I am on the homepage
  Then I should get a "200" HTTP response

Scenario: Accessing to admin menu toolbar
  Given I am logged in as a user with the "Administrateur" role
  When I am on the homepage
  Then I should see an "div#admin-menu-wrapper" element

Scenario: The cache can be cleared
  Given the cache has been cleared
  When I am on the homepage
  Then I should get a "200" HTTP response

Scenario: An Administrateur can administer the modules
  Given I am logged in as a user with the "Administrateur" role
  When I am on "/admin/modules"
  Then I should get a "200" HTTP response

Scenario: An anonymous user can not access to admin pages
  Given I am an anonymous user
  When I am on "/admin"
  Then I should get a "403" HTTP response

Scenario: An Administrateur can create users
  Given users:
  | name     | mail            | status |
  | Joe User | joe@example.com | 1      |
  And I am logged in as a user with the "Administrateur" role
  When I visit "admin/people"
  Then I should see the link "Joe User"

Scenario: An Administrateur can create users with roles
  Given users:
  | name     | mail            | roles         |
  | Joe User | joe@example.com | Administrateur |
  And I am logged in as a user with the "Administrateur" role
  When I visit "admin/people"
  Then I should see the text "Administrateur" in the "Joe User" row

Scenario: Run cron
  Given I am logged in as a user with the "Administrateur" role
  When I run cron
  And am on "admin/reports/status"
  Then I should see the link "lancer le cron manuellement"

Scenario: Login as a user created during this scenario
  Given users:
  | name      | status     | roles |
  | Test user | 1          | Éditeur |
  When I am logged in as "Test user"
  Then I should see the link "Se déconnecter"

Scenario: Error messages
  Given I am on "/user"
  When I press "Se connecter"
  Then I should see the error message "Le champ Mot de passe est requis."
  And I should not see the error message "Désolé, nom d'utilisateur ou mot de passe non reconnu."
  And I should see the following error messages:
  | error messages |
  | Le champ Nom d'utilisateur est requis. |
  | Le champ Mot de passe est requis. |
  And I should not see the following error messages:
  | error messages |
  | Désolé, nom d'utilisateur ou mot de passe non reconnu. |

Scenario: Access denied to register url.
  Given I am on "/user/register"
  Then I should see "Accès refusé"
  And I should see "Vous n'êtes pas autorisé(e) à accéder à cette page."

Scenario: drush command with text matching: drush output correct status
  Given I run drush "st"
  Then drush output should contain "Drupal version"
  Then drush output should contain "Site URI"
  Then drush output should contain "Database driver"
  Then drush output should contain "Successful"
  Then drush output should not contain "NonExistantWord"

Scenario: drush command with arguments: re-enable system
  Given I run drush "en" "system -y"
  Then drush output should contain "system is already enabled."
