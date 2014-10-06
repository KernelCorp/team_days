Feature: Edit profile
  In order partners can edit a profile

  Background:
    Given a partner from "Новосибирск" with domain: "nsk", email: "partner@example.com"


  Scenario: Correct data
    Given I signed in as partner with email "partner@example.com"
    When I go to "partner"
     And I click to "редактировать профиль"
     And I fill up input "name" in the form "edit_partner" as "new name"
     And I submit the form "edit_partner"
    Then I should see text "Данные успешно изменены"
     And My name is "new name"




  Scenario: Incorrect data
    Given I signed in as partner with email "partner@example.com"
    When I go to "partner"
    And I click to "редактировать профиль"
    And I fill up input "email" in the form "edit_partner" as "bademail "
    And I submit the form "edit_partner"
    Then I should see text "Email имеет не верное значение"
    And My email is "partner@example.com"


