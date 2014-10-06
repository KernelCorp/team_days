Feature: Services
  In order to a guest can order a service

  Background:
    Given a service "Выпить чаю"
      And a service "Выпить кофе"
      And a services box "Бацька" with services "Выпить чаю"
      And a partner from "Новосибирск" with domain: "nsk", email: "partner@example.com"
      And a services box "Бацька" available for partner "partner@example.com"
      And I am from "Новосибирск"


  Scenario: Show available service on partner's page
    When I go to "/"
    Then I should see the service "Выпить чаю"
     But I shouldn't the service "Выпить кофе"

  Scenario: Order without paid
    When I go to "/"
     And I select the service "Выпить чаю"
     And I select “заказать без оплаты”
     And I fill up input "email" in the form "new_order" as “client@example.com”
     And I fill up input "name" in the form "new_order" as “name”
     And I submit the form "new_order"
    Then I should see modal window with text "Ваш заказ получен"
     And "client@example.com" should receive an email
     And "partner@example.com" should receive an email

  Scenario: Order with paid
    When I go to "/"
     And I select the service "Выпить чаю"
     And I select “оплатить на сайте”
     And I fill up input "email" in the form "new_order" as “client@example.com”
     And I fill up input "name" in the form "new_order" as “name”
     And I submit the form "new_order"
    Then I should see be redirected to paid system

