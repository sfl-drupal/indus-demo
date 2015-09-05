@api @profile

Feature: Test les pages de profil des utilisateurs

  @r73744
  Scenario: En tant qu'usager non connecté, je ne peux voir que le profil publique des autres utilisateurs
    Given I am an anonymous user
    When I am on "users/melanie"
    Then I should get a 200 HTTP response
    And I should see the text "Mélanie"
    And I should see the text "Publications récentes"
    And I should see 4 "div.view-news div.views-row" element
    And I should see the text "Événements publiés récemment"
    And I should see 6 "div.view-events div.views-row" element
    # I should not see the links of the private profile
    And I should not see the link "Mon profil" in the "Content" region
    And I should not see the link "Mes publications" in the "Content" region
    And I should not see the link "Mes favoris" in the "Content" region
    And I should not see the link "Mes alertes" in the "Content" region
    And I should not see the link "Ajouter un contenu" in the "Content" region

  @r73744
  Scenario: En tant qu'usager CAS, je ne peux voir que le profil publique des autres utilisateurs
    Given I am logged in as personas user "Mickael"
    When I am on "users/melanie"
    Then I should get a 200 HTTP response
    And I should see the text "Mélanie"
    And I should see the text "Publications récentes"
    And I should see 4 "div.view-news div.views-row" element
    And I should see the text "Événements publiés récemment"
    And I should see 6 "div.view-events div.views-row" element
    # I should not see the links of the private profile
    And I should not see the link "Mon profil" in the "Content" region
    And I should not see the link "Mes publications" in the "Content" region
    And I should not see the link "Mes favoris" in the "Content" region
    And I should not see the link "Mes alertes" in the "Content" region
    And I should not see the link "Ajouter un contenu" in the "Content" region

  @r73744
  Scenario: En tant que contributeur, je ne peux voir que le profil publique des autres utilisateurs
    Given I am logged in as a user with the "Éditeur" role
    When I am on "users/melanie"
    Then I should get a 200 HTTP response
    And I should see the text "Mélanie"
    And I should see the text "Publications récentes"
    And I should see 4 "div.view-news div.views-row" element
    And I should see the text "Événements publiés récemment"
    And I should see 6 "div.view-events div.views-row" element
    # I should not see the links of the private profile
    And I should not see the link "Mon profil" in the "Content" region
    And I should not see the link "Mes publications" in the "Content" region
    And I should not see the link "Mes favoris" in the "Content" region
    And I should not see the link "Mes alertes" in the "Content" region
    And I should not see the link "Ajouter un contenu" in the "Content" region

  @r73744
  Scenario: En tant que administrateur, je peux voir le profil publique et privé des autres utilisateurs
    Given I am logged in as a user with the "Administrateur" role
    When I am on "users/melanie"
    Then I should get a 200 HTTP response
    And I should see the text "Mélanie"
    And I should see the text "Publications récentes"
    And I should see 4 "div.view-news div.views-row" element
    And I should see the text "Événements publiés récemment"
    And I should see 6 "div.view-events div.views-row" element
    # I should not see the links of the private profile
    And I should not see the link "Mes publications" in the "Content" region
    And I should not see the link "Mes favoris" in the "Content" region
    And I should not see the link "Mes alertes" in the "Content" region

  Scenario: En tant que "Mélanie", je peux accéder à mon profil privé
    Given I am logged in as personas user "Mélanie"
    Then I go to "users/melanie"
    And I should get a 200 HTTP response
    And I should see the link "Mon profil" in the "Content" region
    And I should see the link "Mes publications" in the "Content" region
    And I should see the link "Mes favoris" in the "Content" region
    And I should see the link "Mes alertes" in the "Content" region
    And I should see the link "Ajouter un contenu" in the "Content" region
    And I should see the text "Mélanie"
    # By default we should see content of the page "Mes publications"
    And I should see 4 "div.pane-news-pane-my-published-news .article-nugget" elements
    And I should see 1 "div.pane-news-pane-my-need-reviews-news .article-nugget" element
    And I should see 1 "div.pane-news-pane-my-drafts-news .article-nugget" element
    And I should see 3 "div.pane-events-pane-my-published-events .node--event" element
    And I should see 1 "div.pane-events-pane-my-need-review-events   .node--event" element
    # Show the content of the page "Mes alertes"
    When I click "Mes alertes" in the "Content" region
    Then I should see 1 "form.user-profile-form" element
    And I should see 1 "#edit-field-thematic" element
    And I should see 1 "#edit-field-thematic-mails" element
    And I should see 1 "#edit-field-degree-level-und" element
    And I should see 1 "#edit-field-degree-level-mails-und" element
    And I should see 1 "#edit-field-discipline-und" element
    And I should see 1 "#edit-field-discipline-mails-und" element
    And I should see 1 "#edit-field-campus-und" element
    And I should see 1 "#edit-field-campus-mails-und" element

  Scenario: As an "Éditeur", I can create a news and see it in my publications
    Given I am logged in as a user with the "Éditeur" role
    Then I go to "node/add/news"
    And I fill in "title" with "Behat news profile"
    And I fill in "field_catchline[und][0][value]" with "Accroche de Behat"
    And I fill in "body[und][0][value]" with "<p>Corps de Behat</p>"
    #Now is a select, not an autocomplete -> And I fill in "field_thematic[und][]" with "Vie étudiante"
    And I fill in "field_thematic[und][]" with "17"
    And I press "Enregistrer"
    Then I go to "profil/publications"
    And I should see 1 "div.pane-news-pane-my-drafts-news .article-nugget" element
    
  @paola
  Scenario: As "Paola", I bookmark an event and a news, then I can see them in my profile
    Given I am logged in as personas user "Paola"
    Then I go to "services-et-salles/contrat-despace-etudiant-en-ligne-en-france-pour-savoir-faire-linux"
    Then I should see the link "Sauvegarder" in the "Content" region
    And I click "Sauvegarder" in the "Content" region
    Then I go to "vie-etudiante/le-ski-club-dauphine-presente-le-grand-prix-dauphine"
    And I click "Sauvegarder" in the "Content" region
    Then I go to "users/paola"
    And I click "Mes favoris" in the "Content" region
    And I should see 1 "div.pane-news-pane-my-bookmarked-news .article-nugget" element
    And I should see 1 "div.pane-events-pane-my-bookmarked-events .node--event" element
    Then I go to "services-et-salles/contrat-despace-etudiant-en-ligne-en-france-pour-savoir-faire-linux"
    And I click "Supprimer" in the "Content" region
    Then I go to "vie-etudiante/le-ski-club-dauphine-presente-le-grand-prix-dauphine"
    And I click "Supprimer" in the "Content" region
    Then I go to "users/paola"
    And I click "Mes favoris" in the "Content" region
    And I should not see an "div.pane-news-pane-my-bookmarked-news .article-nugget" element
    And I should not see an "div.pane-events-pane-my-bookmarked-events .node--event" element

  @my_preferences
  # since chosen, i can't manage to fix this test, grrr..
  Scenario: As "Coralie", I can set my preferences, and my feed will be updated
    Given I am logged in as personas user "Coralie"
    And I am on "users/coralie"
    And I click "Mes alertes" in the "Content" region
    And I fill in "field_thematic[und][]" with "_none"
    And I fill in "field_degree_level[und][]" with "_none"
    And I fill in "field_discipline[und][]" with "_none"
    And I fill in "field_campus[und][]" with "_none"
    Then I press the "edit-submit" button
    And I should see the message "Les changements ont été enregistrés."
    And I go to "user/feed"
    Then I should not see an ".node--teaser-mini-feed" element
    And I am on "users/coralie"
    And I click "Mes alertes" in the "Content" region
    And I fill in "field_thematic[und][]" with "17"
    And I fill in "field_degree_level[und][]" with "_none"
    And I fill in "field_discipline[und][]" with "_none"
    And I fill in "field_campus[und][]" with "_none"
    Then I press the "edit-submit" button
    And I should see the message "Les changements ont été enregistrés."
    Then I go to "user/feed"
    And I should see 5 ".node--teaser-mini-feed" elements

  @edit_my_profil
  Scenario: As a user with the Administrateur role, I can edit all the fields in the users profils
    Given I am logged in as a user with the "Administrateur" role
    And I am on "admin/people"
    And I click "modifier" in the "admin" row
    And I should see 1 "input[name='files[picture_upload]']" element
    And I should see 1 "input.username" element
    And I should see 1 "input[name='cas_name']" element
    And I should see 1 "input[name='pass[pass1]']" element
    And I should see 1 "input[name='pass[pass2]']" element
    And I should see 2 "input[name='status']" element
    And I should see 1 "div.form-item-roles" element
    And I should see 1 "fieldset.group-thematics-and-categories" element
    And I should see 1 "fieldset.group-studies" element
    And I should see 1 "fieldset.group-campus" element
    And I should see 1 "div.form-type-radios.form-item-language" element
    And I should see 1 "div.form-type-radios.form-item-ckeditor-default" element
    And I should see 1 "div.form-type-radios.form-item-ckeditor-show-toggle" element
    And I should see 1 "div.form-type-textfield.form-item-ckeditor-width" element
    And I should see 1 "div.form-type-select.form-item-ckeditor-lang" element
    And I should see 1 "div.form-type-radios.form-item-ckeditor-auto-lang" element

  @edit_my_profil
  Scenario: As "Coralie", I can only edit my image in the form to edit mon profil
    Given I am logged in as personas user "Coralie"
    And I am on "users/coralie"
    Then I click "Mon profil" in the "Content" region
    And I should see 1 "div.pane-profile-head" element
    And I should see 1 "input[name='files[picture_upload]']" element

  @r70592
  Scenario: As an administrator user, I should see a message in the tab "My alerts" the first time I loging.
    Given I am logged in as a user with the "Administrateur" role
    Then I go to "profil/alertes"
    Then I should see the success message "Cette section vous permet de choisir les actualités flash par thème, en fonction de vos centres d'intérêt. Vous pouvez également vous abonner pour recevoir les notifications par e-mail."

  @r70592
  Scenario: As an Éditeur user, I should see a message in the tab "My alerts" the first time I loging.
    Given I am logged in as a user with the "Éditeur" role
    Then I go to "profil/alertes"
    Then I should see the success message "Cette section vous permet de choisir les actualités flash par thème, en fonction de vos centres d'intérêt. Vous pouvez également vous abonner pour recevoir les notifications par e-mail."

  @r70592
  Scenario: As "Coralie", I should see the message in the tab 'My alerts' even if she has been already logged.
    Given I am logged in as personas user "Coralie"
    And I am on "users/coralie"
    Then I click "Mes alertes" in the "Content" region
    Then I should see the success message "Cette section vous permet de choisir les actualités flash par thème, en fonction de vos centres d'intérêt. Vous pouvez également vous abonner pour recevoir les notifications par e-mail."
