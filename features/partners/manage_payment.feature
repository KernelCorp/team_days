Feature: Payment managing

  Background:
    Given a service with name "Коллапсировать сверхновую звезду в черную дыру"
    And a service with name "Поизлучать излучение Хоккинга"
    And a services box "Юный астроном" with services: "Коллапсировать сверхновую звезду в черную дыру, Поизлучать излучение Хоккинга"
    And a partner from "Сколково" with email: "partner@example.com"
    And a services box "Юный астроном" available for partner "partner@example.com"

    And the partner "partner@example.com" has paid order of service "Коллапсировать сверхновую звезду в черную дыру" from "client1@exmaple.com" with status "new"
    And the partner "partner@example.com" has unpaid order of service "Коллапсировать сверхновую звезду в черную дыру" from "client2@exmaple.com" with status "new"
    And the partner "partner@example.com" has paid order of service "Поизлучать излучение Хоккинга" from "client3@exmaple.com" with status "new"
    And the partner "partner@example.com" has unpaid order of service "Поизлучать излучение Хоккинга" from "client4@exmaple.com" with status "new"
    And the partner "partner@example.com" has unpaid order of service "Поизлучать излучение Хоккинга" from "client5@exmaple.com" with status "close"

    And a payment for order from "client1@exmaple.com" created_at: "21-09-2014"
    And a payment for order from "client3@exmaple.com" created_at: "21-10-2014"

    And I signed in as partner with email "partner@example.com"

  @javascript
  Scenario: filter by dates
    When I go to "/partner"
     And I show sidebar
     And I click to "a", "Платежи"
     And I select filter by "date_begin", "1-09-2014"
     And I select filter by "date_end", "30-09-2014"
     And I click to ".button", "ПОИСК"
    Then I should see payment from "client1@exmaple.com"
     But I shouldn't see payment from "client3@exmaple.com"


#  Scenario: filter by service
#    When I go to "partner"
#    And I click on "платежи"
#    And I select filter by "service:'Коллапсировать сверхновую звезду в черную дыру'"
#    Then I should see payment from "client1@exmaple.com"
#    But I shouldn't see payment from "client3@exmaple.com"