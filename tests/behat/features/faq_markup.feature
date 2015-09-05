@api @faq

Feature: Test FAQs markup

  Scenario: The site has a FAQ page properly set with the correct markup
    Given I am an anonymous user
    When I am on "faq"
    Then I should see 1 "section.cd-faq" element
    Then I should see 1 ".cd-faq-categories" element
    Then I should see 1 ".cd-faq-items" element
    Then I should see 4 ".cd-faq-title" element
    Then I should see 4 ".cd-faq-group" element
    Then I should see 13 ".cd-faq-trigger" element
    Then I should see 13 ".cd-faq-content" element
