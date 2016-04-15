@api @generic
Feature: Generic site features and global health

@basic
Scenario: The homepage must load properly
  Given I am on the homepage
  Then I should get a "200" HTTP response

Scenario: Accessing to admin menu toolbar
  Given I am logged in as a user with the "administrator" role
  When I am on the homepage
  Then I should see an "div#admin-menu-wrapper" element

Scenario: The cache can be cleared
  Given the cache has been cleared
  When I am on the homepage
  Then I should get a "200" HTTP response

Scenario: An administrator can administer the modules
  Given I am logged in as a user with the "administrator" role
  When I am on "/admin/modules"
  Then I should get a "200" HTTP response

Scenario: An anonymous user can not access to admin pages
  Given I am an anonymous user
  When I am on "/admin"
  Then I should get a "403" HTTP response

Scenario: An administrator can create users
  Given users:
  | name     | mail            | status |
  | Joe User | joe@example.com | 1      |
  And I am logged in as a user with the "administrator" role
  When I visit "admin/people"
  Then I should see the link "Joe User"

Scenario: An administrator can create users with roles
  Given users:
  | name     | mail            | roles         |
  | Joe User | joe@example.com | administrator |
  And I am logged in as a user with the "administrator" role
  When I visit "admin/people"
  Then I should see the text "administrator" in the "Joe User" row

Scenario: Run cron
  Given I am logged in as a user with the "administrator" role
  When I run cron
  And am on "admin/reports/status"
  Then I should see the link "run cron manually"

Scenario: Login as a user created during this scenario
  Given users:
  | name      | status     | roles |
  | Test user | 1          | authenticated user |
  When I am logged in as "Test user"
  Then I should see the link "Log out"

Scenario: Error messages
  Given I am on "/user"
  When I press "Log in"
  Then I should see the following error messages:
  | error messages |
  | Username field is required. |
  | Password field is required. |
  And I should not see the following error messages:
  | error messages |
  | Sorry, unrecognized username or password. |

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
