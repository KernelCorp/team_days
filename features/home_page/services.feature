Feature: Services
  In order to a guest can order a service

  Background:
    Given a service with name "Выпить чаю"
      And a service with name "Выпить кофе"
      And a services box "Бацька" with services: "Выпить чаю"
      And a partner from "Новосибирск" with domain: "nsk", email: "partner@example.com"
      And a services box "Бацька" available for partner "partner@example.com"
      And I am in "Новосибирск"

  @javascript
  Scenario: Show available service on partner's page
    When I go to "/"
    Then I should see the service "Выпить чаю"
     But I shouldn't the service "Выпить кофе"

  @javascript
  Scenario: Order without paid
    When I go to "/"
     And I select the service "Выпить чаю"
     And I fill up input "order[client_info][email]" in the form "new_order" as "client@example.com"
     And I fill up input "order[client_info][name]" in the form "new_order" as "name"
     And I fill up with keyboard input "order[client_info][phone]" in the form "new_order" as "9231283379"
     And I submit the form "new_order"
    Then I should see ".header", "Ваш заказ принят"
     And "client@example.com" should receive an email
     And "partner@example.com" should receive an email

  @javascript
  Scenario: Order with paid
    When I go to "/"
     And I select the service "Выпить чаю"
     And I check checkbox
     And I fill up input "order[client_info][email]" in the form "new_order" as "client@example.com"
     And I fill up input "order[client_info][name]" in the form "new_order" as "name"
     And I fill up with keyboard input "order[client_info][phone]" in the form "new_order" as "9231283379"
     And I submit the form "new_order"
    Then I should see be redirected to paid system

