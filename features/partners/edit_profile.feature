Feature: Edit profile
  In order partners can edit a profile

  Background:
    Given a partner from "Новосибирск" with email: "partner@example.com"

  @javascript
  Scenario: Correct data
    Given I signed in as partner with email "partner@example.com"
    When I go to "/partner"
     And I click to edit profile
     And I fill up input "email" in the form "edit_partner" as "new@email.com"
     And I submit the form "edit_partner"
#    Then I should see text "Данные успешно изменены"
     Then My email is "new@email.com"



  @javascript
  Scenario: Incorrect data
    Given I signed in as partner with email "partner@example.com"
    When I go to "/partner"
    And I click to edit profile
    And I fill up input "email" in the form "edit_partner" as "bademail"
    And I submit the form "edit_partner"
#    Then I should see text "Email имеет не верное значение"
    Then My email is "partner@example.com"


