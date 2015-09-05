@api @srf

Feature: Test les champs requis seulement pour la publication (Semi-required fields) et l'intégration avec Workbench

  @admin
  Scenario: En tant qu'administrateur, je dois voir une configuration correcte des champs requis pour la publication
    Given I am logged in as a user with the "Administrateur" role
    And I go to "admin/structure/types/manage/page/fields/body"
    When I select "1" from "instance[required]"
    Then I should see 1 "div.form-item-instance-workbench-moderation" element
    And I should see the text "Revisions and moderations must be enabled in order to use this functionality."
    # Dissable the semi-required-field for the field_image to make the test.
    And I go to "admin/structure/types/manage/news/fields/field_image"
    When I select "1" from "instance[required]"
    Then I should see 1 "div.form-item-instance-workbench-moderation" element
    Then I should see 1 "div#edit-instance-workbench-moderation-status" element
    Then I should see 3 "div#edit-instance-workbench-moderation-status > .form-type-checkbox" element
    And I check the box "edit-instance-workbench-moderation-status-needs-review"
    And I check the box "edit-instance-workbench-moderation-status-published"
    When I select "0" from "instance[required]"
    Then I press the "Enregistrer les paramètres" button

  @admin
  Scenario: En tant qu'administrateur, teste les différents champs requis pour la publication
    Given I am logged in as a user with the "Administrateur" role
    Then I go to "node/add/news"
    And I fill in "title" with "My news as an admin"
    #Now is a select not an autocomplete -> And I fill in "field_thematic[und][]" with "Santé"
    And I fill in "field_thematic[und][]" with "42"
    # I don't select draft because it's default state
    When I press the "Enregistrer" button
    Then I should see the heading "My news as an admin" in the "Content" region
    And I follow "Modifier le brouillon" in the "Content" region
    And I select "needs_review" from "workbench_moderation_state_new"
    When I press the "Enregistrer" button
    # I can't test error message cause status messages are defined to match with front theme
    Then I should see the message "Field Accroche is required to pass this content as: needs_review."
    Then I should see the message "Field Corps is required to pass this content as: needs_review."
    And I fill in "field_catchline[und][0][value]" with "My catchline"
    And I fill in "body[und][0][value]" with "<p>and my body</p>"
    And I select "needs_review" from "workbench_moderation_state_new"
    When I press the "Enregistrer" button
    # But I can test here, because as success, content is presented in front theme
    Then I should see the success message "Le contenu 'My news as an admin', de type 'Actualité', a été mis à jour."
    Then I follow "Modifier le brouillon" in the "Content" region
    And I fill in "body[und][0][value]" with ""
    And I select "published" from "workbench_moderation_state_new"
    When I press the "Enregistrer" button
    Then I should see the message "Field Corps is required to pass this content as: published."
    And I fill in "body[und][0][value]" with "<p>and my body</p>"
    And I select "published" from "workbench_moderation_state_new"
    When I press the "Enregistrer" button
    Then I should see the success message "Le contenu 'My news as an admin', de type 'Actualité', a été mis à jour."

  @etudiant
  Scenario:  En tant qu'étudiant, teste les différents champs requis pour la publication
    Given I am logged in as personas user "Mélanie"
    Then I go to "node/add/news"
    And I fill in "title" with "Mon actu cool"
    #Now is a select not an autocomplete -> And I fill in "field_thematic[und][]" with "Vie étudiante"
    And I fill in "field_thematic[und][]" with "20"
    When I press the "Enregistrer comme brouillon" button
    Then I should see the text "Votre contenu Mon actu cool de type Actualité est enregistré comme brouillon."
    Then I go to "user"
    And I should see "Mon actu cool" in the "div.pane-news-pane-my-drafts-news div.article-nugget" element
    Then I follow "Mon actu cool" in the "Content" region
    Then I follow "Modifier le brouillon" in the "Content" region
    When I press the "Publier" button
    Then I should see the error message "Field Accroche is required to pass this content as: needs_review."
    Then I should see the error message "Field Corps is required to pass this content as: needs_review."
    And I fill in "field_catchline[und][0][value]" with "My catchline"
    And I fill in "body[und][0][value]" with "My catchline"
    When I press the "Publier" button
    Then I go to "user"
    And I should see "Mon actu cool" in the "div.pane-news-pane-my-need-reviews-news .article-nugget" element

  @admin
  Scenario: En tant qu'administrateur, je dois voir une configuration correcte des champs requis pour la publication
    # Enable the semi-required-field for the field_image at the end of test.
    Given I am logged in as a user with the "Administrateur" role
    And I go to "admin/structure/types/manage/news/fields/field_image"
    When I select "1" from "instance[required]"
    Then I should see 1 "div.form-item-instance-workbench-moderation" element
    Then I should see 1 "div#edit-instance-workbench-moderation-status" element
    Then I should see 3 "div#edit-instance-workbench-moderation-status > .form-type-checkbox" element
    And I check the box "edit-instance-workbench-moderation"
    And I check the box "edit-instance-workbench-moderation-status-needs-review"
    And I check the box "edit-instance-workbench-moderation-status-published"
    Then I press the "Enregistrer les paramètres" button
