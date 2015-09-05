@api @thematicspages

Feature: Thematics subhomes features

Scenario: As an anonymous user, I can navigate in Insertion Professionnelle et Orientation home
  Given I am an anonymous user
  When I go to "insertion-professionnelle-et-orientation"
  Then I should get a "200" HTTP response
  And I should see 1 "#insertion-professionnelle-et-orientation--le-luxe-dauphine.node--news--teaser-detail" element
  And I should see 2 "div.views-row div.article-nugget" element
  And I should see 1 ".pane-taxonomy-term-description .taxonomy-term-description p" element
  And I should see 1 "ul.nav-beta__sublist" element
  And I should see 4 "ul.nav-beta__sublist li.nav-beta__subitem" elements
  And I should see 3 "ul.nav-beta__sublist li.nav-beta__subitem ul.nav-beta__subsublist" elements
  # Comment this out as the page is not finished yet
  # And I should see 8 "ul.nav-beta__sublist li.nav-beta__subitem ul.nav-beta__subsublist li.nav-beta__subsubitem" elements
