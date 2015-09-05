@api @breadcrumb @r74578

Feature: Vérifie que le fil d'Ariane est généré et affiché selon les spécifications

Scenario: En tant qu'utilisateur du site, je dois pouvoir naviguer à l'aide du fil d'Ariane
    Given I am an anonymous user
    When I visit "services-et-salles/contrat-despace-etudiant-en-ligne-en-france-pour-savoir-faire-linux"
    Then I should see the link "Accueil" in the "Breadcrumb" region
    And I should see the link "Actualités" in the "Breadcrumb" region
    And I should see the link "Services et salles" in the "Breadcrumb" region
    And I should see "Contrat d'espace étudiant en ligne en France pour Savoir-faire Linux" in the ".nav-breadcrumb .nav-breadcrumb__crumb.state--current" element
    When I click "Services et salles" in the "Breadcrumb" region
    Then I should be on "actualites"
    And I should see the link "Accueil" in the "Breadcrumb" region
    When I visit "stages-jobs-et-emplois"
    Then I should see the link "Accueil" in the "Breadcrumb" region
    And I should see the link "Insertion professionnelle et orientation" in the "Breadcrumb" region
    And I should see "Stages, jobs et emplois" in the ".nav-breadcrumb .nav-breadcrumb__crumb.state--current" element
    When I visit "vie-pratique/le-salon-international-du-tourisme-montreal"
    Then I should see the link "Accueil" in the "Breadcrumb" region
    And I should see the link "Evénements" in the "Breadcrumb" region
    And I should see the link "Vie pratique" in the "Breadcrumb" region
    And I should see "Le Salon International du Tourisme à Montréal" in the ".nav-breadcrumb .nav-breadcrumb__crumb.state--current" element
    When I click "Accueil" in the "Breadcrumb" region
    # Breadcrumb is printed but empty, so check if there are link in.
    Then I should not see a ".nav-breadcrumb .nav-breadcrumb__crumb" element
