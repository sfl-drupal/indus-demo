@api @playlist

Feature: Playlist page

Scenario: As an anonymous user, I can navigate in Insertion Professionnelle et Orientation home
  Given I am an anonymous user
  When I go to "playlist"
  Then I should get a "200" HTTP response
  And I should see the link "Vidéos"
  And I should see the link "Audios"
  And I should see 1 ".node--playlist--teaser" element
  And I should see "Vidéo" in the ".node--playlist--teaser .news__type" element
  When I click "Audios"
  Then I should see 1 ".node--playlist--teaser" element
  And I should see "Audio" in the ".node--playlist--teaser .news__type" element
