@api @comments
Feature: Test the presence of comments forms in the pages of nodes.

  @admin
  Scenario: An administrator can see the comments form in a content of type "Actualité"
    Given I am logged in as a user with the "Administrateur" role
    When I visit "vie-etudiante/ceremonie-de-remise-des-doctorats-2014" 
    Then I should see the text "Ajouter un commentaire"
    Then I should see the text "Être notifié des réponses"
    And I should see 1 "div.form-item.form-type-textarea" element
    And I should see 1 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules
    # And I should see "dauphicon-abuse-comment" element
    # And I should see "reply" element

  @editor
  Scenario: An editor can see the comments form in a content of type "Actualité"
    Given I am logged in as a user with the "Éditeur" role
    When I visit "insertion-professionnelle-et-orientation/le-luxe-dauphine" 
    Then I should see the text "Ajouter un commentaire"
    Then I should see the text "Être notifié des réponses"
    And I should see 1 "div.form-item.form-type-textarea" element
    And I should see 1 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules

  @userCAS  
  Scenario: An user CAS can see the comments form in a content of type "Actualité"
    Given I am logged in as personas user "Mickael"
    When I visit "vie-etudiante/trois-medailles-de-plus-pour-dauphine" 
    Then I should see the text "Ajouter un commentaire"
    Then I should see the text "Être notifié des réponses"
    And I should see 1 "div.form-item.form-type-textarea" element
    And I should see 1 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules

  @admin
  Scenario: An administrator can see the comments form in a content of type "Évènements"
    Given I am logged in as a user with the "Administrateur" role
    When I visit "vie-pratique/le-salon-international-du-tourisme-montreal" 
    Then I should see the text "Ajouter un commentaire"
    Then I should see the text "Être notifié des réponses"
    And I should see 1 "div.form-item.form-type-textarea" element
    And I should see 1 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules

  @editor
  Scenario: An editor can see the comments form in a content of type "Évènements"
    Given I am logged in as a user with the "Éditeur" role
    When I visit "vie-etudiante/chinese-man-en-concert" 
    Then I should see the text "Ajouter un commentaire"
    Then I should see the text "Être notifié des réponses"
    And I should see 1 "div.form-item.form-type-textarea" element
    And I should see 1 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules

  @userCAS  
  Scenario: An user CAS can see the comments form in a content of type "Évènements"
    Given I am logged in as personas user "Mickael"
    When I visit "vie-etudiante/le-ski-club-dauphine-presente-le-grand-prix-dauphine" 
    Then I should see the text "Ajouter un commentaire"
    Then I should see the text "Être notifié des réponses"
    And I should see 1 "div.form-item.form-type-textarea" element
    And I should see 1 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules

  @admin
  Scenario: An administrator can see the comments form in a content of type "Appel à projet"
    Given I am logged in as a user with the "Administrateur" role
    When I visit "content/fibonacci-clock-une-horloge-stylee-et-open-source-pour-les-nerds" 
    Then I should see the text "Ajouter un commentaire"
    Then I should see the text "Être notifié des réponses"
    And I should see 1 "div.form-item.form-type-textarea" element
    And I should see 1 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules
  
  @editor
  Scenario: An editor can see the comments form in a content of type "Appel à projet"
    Given I am logged in as a user with the "Éditeur" role
    When I visit "content/makey-makey-go-invente-partout-invente-maintenant" 
    Then I should see the text "Ajouter un commentaire"
    Then I should see the text "Être notifié des réponses"
    And I should see 1 "div.form-item.form-type-textarea" element
    And I should see 1 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules

  @userCAS  
  Scenario: An user CAS can see the comments form in a content of type "Appel à projet"
    Given I am logged in as personas user "Mickael"
    When I visit "content/makey-makey-go-invente-partout-invente-maintenant" 
    Then I should see the text "Ajouter un commentaire"
    Then I should see the text "Être notifié des réponses"
    And I should see 1 "div.form-item.form-type-textarea" element
    And I should see 1 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules

  @admin
  Scenario: An administrator can not see the comments form in a content of type "Page de base"
    Given I am logged in as a user with the "Administrateur" role
    When I visit "insertion-professionnelle-et-orientation/conferences-metiers" 
    Then I should not see the text "Ajouter un commentaire"
    Then I should not see the text "Être notifié des réponses"
    And I should see 0 "div.form-item.form-type-textarea" element
    And I should see 0 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules

  @editor
  Scenario: An editor can not see the comments form in a content of type "Page de base"
    Given I am logged in as a user with the "Éditeur" role
    When I visit "insertion-professionnelle-et-orientation/choisir-la-recherche" 
    Then I should not see the text "Ajouter un commentaire"
    Then I should not see the text "Être notifié des réponses"
    And I should see 0 "div.form-item.form-type-textarea" element
    And I should see 0 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules

  @userCAS  
  Scenario: An user CAS can not see the comments form in a content of type "Page de base"
    Given I am logged in as personas user "Mickael"
    When I visit "insertion-professionnelle-et-orientation/stages-jobs-et-emplois" 
    Then I should not see the text "Ajouter un commentaire"
    Then I should not see the text "Être notifié des réponses"
    And I should see 0 "div.form-item.form-type-textarea" element
    And I should see 0 "input[name='notify']" element
    # Uncomment when the merge branche comment_modules