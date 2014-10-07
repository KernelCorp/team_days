Feature: Manage Partners
  In order to an admin can enable services box for partners and disable specific service


  Background:
    Given a service "Собрать Майдан"
      And a service "Уронить сало"
      And a services box "Active" with services: "Собрать Майдан", "Уронить сало"
      And a partner from "Киев" with domain: "rospil", email: "partner@example.com"
      And I signed in as admin

  Scenario: enable service box
    When I go to "/admin/partners"
     And I click to edit partner: "partner@example.com"
     And I select services box "Active"
     And I submit the form
     And I signed in as partner with email "partner@example.com"
     And I go to "/partner"
     And I click on "Управление услугами"
    Then I should see service "Собрать Майдан"
     And I should see service "Уронить сало"

  Scenario: enable service box
    Given a services box "Active" available for the partner "partner@example.com"
    When I go to "/admin/partners"
    And I click to edit partner: "partner@example.com"
    And I disable service "Собрать Майдан"
    And I submit the form
    And I signed in as partner with email "partner@example.com"
    And I go to "/partner"
    And I click on "Управление услугами"
    Then I shouldn't see service "Собрать Майдан"
    But I should see service "Уронить сало"