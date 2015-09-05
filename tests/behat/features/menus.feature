@api @menus

Feature: Teste les différents menus: top, main, contact, social, list and useful-links

  @header-menus @top-menu
  Scenario: Count three links in top menu, to My Course, BIRD and CareerCenter
    Given I am on the homepage
    Then I should see 1 "div#navAppsLinks" element
    And I should see 3 "div#navAppsLinks ul.nav-appslinks__list li.nav-appslinks__item" elements
    And I should see the link "Mes Cours" in the "PanelNav" region
    And I should see the link "Recherche documentaire" in the "PanelNav" region
    And I should see the link "Career Center" in the "PanelNav" region

  @header-menus @main-menu @language-switcher
  Scenario: Count six level-one links in FR main menu and six in EN main menu
    Given I am on the homepage
    Then I should see 1 "nav#navAlpha" element
    And I should see 6 "nav#navAlpha > ul.nav-alpha__list > li.nav-alpha__item" elements
    And I should see the link "Vie étudiante" in the "PanelNav" region
    When I click "Vie étudiante" in the "PanelNav" region
    Then I should be on "vie-etudiante"
    # Temprorarily disable cause language switch is disabled
    # When I click "EN English" in the "PanelNav" region
    # Then I should be on "en/student-services"
    # And I should see 1 "nav#navAlpha" element
    # And I should see 6 "nav#navAlpha > ul.nav-alpha__list > li.nav-alpha__item" elements

  @footer-menus @contact-menu
  Scenario: See "MyDauphine" title and count three links in contact menu
    Given I am on the homepage
    Then I should see 1 ".menuFooter__contact" element
    And I should see 3 ".menuFooter__contact ul.nav-contact__list li.nav-contact__item a.nav-contact__link" elements

  @footer-menus @social-menu
  Scenario: See internationalized menu title and count five links in FR social menu and only three in EN social menu
    Given I am on the homepage
    Then I should see 1 ".menuFooter__social" element
    And I should see "Suivez-nous" in the ".menuFooter__social span" element
    And I should see 5 ".menuFooter__social ul.nav-social__list li.nav-social__item a.nav-social__link" elements
    # Temprorarily disable cause language switch is disabled
    # When I click "EN English" in the "PanelNav" region
    # Then I should see 1 ".menuFooter__social" element
    # And I should see "Follow us" in the ".menuFooter__social span" element
    # And I should see 5 ".menuFooter__social ul.nav-social__list li.nav-social__item a.nav-social__link" elements

  @footer-menus @list-menu
  Scenario: Count links in list menu
    Given I am on the homepage
    Then I should see 1 ".menuFooter__list" element
    And I should not see an ".menuFooter__list p" element
    And I should see the link "Foire aux questions" in the "Footer" region
    And I should see the link "Actualités" in the "Footer" region
    And I should see the link "Évènements" in the "Footer" region

  @footer-menus @useful-links-menu
  Scenario: See internationalized menu title and count two links in FR useful-links menu and two in EN useful-links menu
    Given I am on the homepage
    Then I should see 1 ".menuFooter__useful-links" element
    And I should see "Liens utiles" in the ".menuFooter__useful-links .typo--title-mini" element
    And I should see 2 ".menuFooter__useful-links ul.nav-useful-links__list li.nav-useful-links__item a.nav-useful-links__link" elements
    # Temprorarily disable cause language switch is disabled
    # When I click "EN English" in the "PanelNav" region
    # Then I should see 1 ".menuFooter__useful-links" element
    # And I should see "Useful links" in the ".menuFooter__useful-links .typo--title-mini" element
    # And I should see 2 ".menuFooter__useful-links ul.nav-useful-links__list li.nav-useful-links__item a.nav-useful-links__link" elements

  @profil-menus
  Scenario: Not logged user should see only the element Connexion in the menu-profil
    Given I am on the homepage
    Then I should see the link "Connexion"
    Then I should not see the link "Mes publications"
    Then I should not see the link "Mes favoris"
    Then I should not see the link "Mes préférences"
    Then I should not see the link "Mon emploi du temps"
    Then I should not see the link "Ma messagerie"
    Then I should not see the link "Mes notes"
    Then I should not see the link "Mon trombinoscope"
    Then I should not see the link "Mon espace de stockage"
    Then I should not see the link "Conventions de stage"
    Then I should not see the link "Mon mot de passe"
    Then I should not see the link "Déconnexion"
    Then I should not see the link "Ajouter un contenu"
    # Not logged user should not see the Hotnews button
    Then I should get a "200" HTTP response

  @profil-menus
  Scenario: As an administrator I should see the profil-menu et tester tous se liens.
    Given I am logged in as a user with the "Administrateur" role
    Then I should not see the link "Connexion"
    # Logged user should see the Hotnews button
    Then I should see 2 "ul.nav-member__list > li.nav-member__item" element
    Then I should see the link "Mes publications"
    When I click "Mes publications"
    Then print current URL
    Then I should see the link "Mes favoris"
    When I click "Mes favoris"
    Then print current URL
    Then I should see the link "Mes préférences"
    When I click "Mes préférences"
    Then print current URL
    Then I should see the link "Mon emploi du temps"
    Then I should see the link "Ma messagerie"
    Then I should see the link "Mes notes"
    Then I should see the link "Mon trombinoscope"
    Then I should see the link "Mon espace de stockage"
    Then I should see the link "Conventions de stage"
    Then I should see the link "Mon mot de passe"
    Then I should see the link "Déconnexion"
    Then I should see the link "Ajouter un contenu"
    When I click "Ajouter un contenu"
    Then print current URL
    And I should get a "200" HTTP response

  @profil-menus
  Scenario: As an editeur I should see the profil-menu et tester tous se liens.
    Given I am logged in as a user with the "Editeur" role
    Then I should not see the link "Connexion"
    Then I should see the link "Mes publications"
    When I click "Mes publications"
    Then print current URL
    Then I should see the link "Mes favoris"
    When I click "Mes favoris"
    Then print current URL
    Then I should see the link "Mes préférences"
    When I click "Mes préférences"
    Then print current URL
    Then I should see the link "Mon emploi du temps"
    Then I should see the link "Ma messagerie"
    Then I should see the link "Mes notes"
    Then I should see the link "Mon trombinoscope"
    Then I should see the link "Mon espace de stockage"
    Then I should see the link "Conventions de stage"
    Then I should see the link "Mon mot de passe"
    Then I should see the link "Déconnexion"
    Then I should see the link "Ajouter un contenu"
    When I click "Ajouter un contenu"
    Then print current URL
    # Logged user should see the Hotnews button
    And I should get a "200" HTTP response

  @profil-menus
  Scenario: As an user personas I should see the profil-menu et tester tous se liens.
    Given I am logged in as personas user "Mickael"
    Then I should not see the link "Connexion"
    Then I should see the link "Mes publications"
    When I click "Mes publications"
    Then print current URL
    Then I should see the link "Mes favoris"
    When I click "Mes favoris"
    Then print current URL
    Then I should see the link "Mes préférences"
    When I click "Mes préférences"
    Then print current URL
    Then I should see the link "Mon emploi du temps"
    Then I should see the link "Ma messagerie"
    Then I should see the link "Mes notes"
    Then I should see the link "Mon trombinoscope"
    Then I should see the link "Mon espace de stockage"
    Then I should see the link "Conventions de stage"
    Then I should see the link "Mon mot de passe"
    Then I should see the link "Déconnexion"
    Then I should see the link "Ajouter un contenu"
    When I click "Ajouter un contenu"
    Then print current URL
    # Logged user should see the Hotnews button
    Then I should see 2 "ul.nav-member__sublist--myprofile > li.nav-member__subitem" element

  @profil-menus
  Scenario: As an user CAS I should see the profil-menu et tester tous se liens.
    Given I am an anonymous user
    When I go to "/cas"
    Then print current URL
    Then I fill in "username" with "mimote14"
    And I fill in "password" with "22++SFL2015"
    And I press the "submit" button
    # Then I look to the links of the menu
    Then I should not see the link "Connexion"
    Then I should see the link "Mes publications"
    When I click "Mes publications"
    Then print current URL
    Then I should see the link "Mes favoris"
    When I click "Mes favoris"
    Then print current URL
    Then I should see the link "Mes préférences"
    When I click "Mes préférences"
    Then print current URL
    Then I should see the link "Mon emploi du temps"
    Then I should see the link "Ma messagerie"
    Then I should see the link "Mes notes"
    Then I should see the link "Mon trombinoscope"
    Then I should see the link "Mon espace de stockage"
    Then I should see the link "Conventions de stage"
    Then I should see the link "Mon mot de passe"
    Then I should see the link "Déconnexion"
    Then I should see the link "Ajouter un contenu"
    When I click "Ajouter un contenu"
    Then print current URL
    # Logged user should see the Hotnews button
    Then I should see 2 "ul.nav-member__sublist--myprofile > li.nav-member__subitem" element
    Then I go to "/caslogout"
    Then print current URL

