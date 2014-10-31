Feature: Manage Partners
  In order to an admin can enable services box for partners and disable specific service


  Background:
    Given a service with name "Собрать Майдан"
      And a service with name "Уронить сало"
      And a services box "Active" with services: "Собрать Майдан, Уронить сало"
      And a partner from "Киев" with domain: "rospil", email: "partner@example.com"
      And I signed in as admin

  @javascript
  Scenario: enable service box
    When I go to "/admin/user~partner"
     And I click to edit partner: "partner@example.com"
     And I select services box "Active"
     And I click to submit
     And I signed in as partner with email "partner@example.com"
     And I go to "/partner"
     And I show sidebar
     And I click on "Управление услугами"
    Then I should see in table service "Собрать Майдан"
     And I should see in table service "Уронить сало"
  @javascript
  Scenario: enable service box
    Given a services box "Active" available for partner "partner@example.com"
    When I go to "/admin/user~partner"
    And I click to edit partner: "partner@example.com"
    And I deselect service "Собрать Майдан"
    And I click to submit
    And I signed in as partner with email "partner@example.com"
    And I go to "/partner"
    And I show sidebar

    And I click on "Управление услугами"
    Then I should see banned in table service "Собрать Майдан"
    But I should see in table service "Уронить сало"