@api @cas @r66113
Feature: Un utilisation CAS doit voir ses informations automatiquement importées

  @test
  Scenario: En tant qu'utilisateur CAS, mon nom complet doit être importé
    Given I am an anonymous user
    When I go to "/cas"
    Then print current URL
    Then I fill in "username" with "mimote14"
    And I fill in "password" with "22++SFL2015"
    And I press the "submit" button
    # Importe correctement le "displayname" de l'utilisateur
    Then I should see the success message "Logged in via CAS as Test Mimosa."
    Then I go to "/caslogout"
    Then print current URL


 @test
  Scenario: En tant qu'administrateur, je dois voir les attributs CAS des utilisateurs
    Given I am logged in as a user with the "Administrateur" role
    When I visit "admin/people"
    Then I should see the "modifier" in the "Test Mimosa" row
    And I should see an "input[value='test.mimosa.14@campus.dauphine.frtest.mimosa@dauphine.eu']" element
    And I should see an "input[value='MSO']" element

  @local
  Scenario: En tant qu'utilisateur CAS, mon nom complet doit être importé
    Given I am an anonymous user
    When I go to "/cas"
    Then print current URL
    Then I fill in "username" with "mimote14"
    And I fill in "password" with "22++SFL2015"
    And I press the "submit" button
    # Importe correctement le "displayname" de l'utilisateur
    Then I should see the success message "Logged in via CAS as mimote14."
    Then I go to "/caslogout"
    Then print current URL

 @local
  Scenario: En tant qu'administrateur, je dois voir les attributs CAS des utilisateurs
    Given I am logged in as a user with the "Administrateur" role
    When I visit "admin/people"
    Then I should see the "modifier" in the "mimote14" row
    And I should see an "input[value='mimote14@dauphine.fr']" element
    And I should see an "input[value='MSO']" element
