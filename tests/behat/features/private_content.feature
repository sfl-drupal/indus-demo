@api @private_content
Feature: Test creation of public and private content

  @admin @createcontent
  Scenario: An administrator can add a public and a private alert
    Given I am logged in as a user with the "Administrateur" role
    # Test a private alert
    When I visit "node/add/alert"
    Then I fill in "title" with "Private alert"
    And I fill in "body[und][0][value]" with "<p>This is a test of a private alert</p>"
    And I check the box "edit-private"
    And I press the "Enregistrer" button
    Then print current URL
    When I visit "content/private-alert"
    Then I should see "This is a test of a private alert"
    # Test a public alert
    When I visit "node/add/alert"
    Then I fill in "title" with "Public alert"
    And I fill in "body[und][0][value]" with "<p>This is a test of a public alert</p>"
    And I uncheck the box "edit-private"
    And I press the "Enregistrer" button
    When I visit "content/public-alert"
    #Then I should see "This is a test of a public alert"

  @disabled @editor @createcontent
  Scenario: An editeur can add a public and a private alert
    Given I am logged in as a user with the "Editeur" role
    # Test a private alert
    When I visit "node/add/alert"
    Then I fill in "title" with "Private alert"
    And I fill in "body[und][0][value]" with "<p>This is a test of a private alert</p>"
    And I check the box "edit-private"
    And I press the "Enregistrer" button
    Then print current URL
    When I visit "content/private-alert"
    Then I should see "This is a test of a private alert"
    # Test a public alert
    When I visit "node/add/alert"
    Then I fill in "title" with "Public alert"
    And I fill in "body[und][0][value]" with "<p>This is a test of a public alert</p>"
    And I uncheck the box "edit-private"
    And I press the "Enregistrer" button
    When I visit "content/public-alert"
    #Then I should see "This is a test of a public alert"


  @editor
  Scenario: An editeur can see the private alerts
    Given I am logged in as a user with the "Editeur" role
    When I go to "content/jours-feries"
    # I should be able to access to the page. Code status 200 OK
    Then the response status code should be 200
    # You are authorized to access to this page.
    Then I should not get a 403 HTTP response
    When I go to "en/content/public-holidays"
    # I should be able to access to the page. Code status 200 OK
    Then the response status code should be 200
    # You are authorized to access to this page.
    Then I should not get a 403 HTTP response

  @utilisateur CAS
  Scenario: An utilisateur CAS can see the private alerts
    Given I am logged in as personas user "Mickael"
    When I go to "content/jours-feries"
    # I should be able to access to the page. Code status 200 OK
    Then the response status code should be 200
    # You are authorized to access to this page.
    Then I should not get a 403 HTTP response
    When I go to "en/content/public-holidays"
    # I should be able to access to the page. Code status 200 OK
    Then the response status code should be 200
    # You are authorized to access to this page.
    Then I should not get a 403 HTTP response

  @anonyme
  Scenario: An utilisateur anonyme can not see the private alerts
    Given I am an anonymous user
    When I go to "content/jours-feries"
    # I should not be able to access to the page. Code status 200 OK
    Then I should not get a 200 HTTP response
    # You are not authorized to access to this page. Code status 403 Forbidden
    Then the response status code should be 403
    When I go to "en/content/public-holidays"
    # I should not be able to access to the page. Code status 200 OK
    Then I should not get a 200 HTTP response
    # You are not authorized to access to this page. Code status 403 Forbidden
    Then the response status code should be 403
