@api @events

Feature: Events page

@events
Scenario: As an anonymous user, I can navigate in the page Events
  Given I am an anonymous user
  When I go to "evenements"
  Then I should get a "200" HTTP response
  And I should see the link "Par mois"
  And I should see the link "Par semaine"
  And I should see the link "Par jour"
  And I should see the link "Préc."
  And I should see the link "Suiv."
