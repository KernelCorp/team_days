Feature: Orders managing

  Background:
    Given a service with name "Коллапсировать сверхновую звезду в черную дыру"
     And a service with name "Поизлучать излучение Хоккинга"
     And a services box "Юный астроном" with services: "Коллапсировать сверхновую звезду в черную дыру", "Поизлучать излучение Хоккинга"
     And a partner from "Сколково" with email: "partner@example.com"
     And a services box "Юный астроном" available for partner "partner@example.com"

     And the partner "partner@example.com" has paid order of service "Коллапсировать сверхновую звезду в черную дыру" from "client1@exmaple.com" with status "new"
     And the partner "partner@example.com" has unpaid order of service "Коллапсировать сверхновую звезду в черную дыру" from "client2@exmaple.com" with status "new"
     And the partner "partner@example.com" has paid order of service "Поизлучать излучение Хоккинга" from "client3@exmaple.com" with status "new"
     And the partner "partner@example.com" has unpaid order of service "Поизлучать излучение Хоккинга" from "client4@exmaple.com" with status "new"
     And the partner "partner@example.com" has unpaid order of service "Поизлучать излучение Хоккинга" from "client5@exmaple.com" with status "close"

     And I signed in as partner with email "partner@example.com"

  @javascript
  Scenario Outline:
    When I go to "/partner"
     And I click on "Управление заказами"
     And I select filter by "<filter_name>" with "<filter_value>"
    Then I should see orders from: "<visible_orders>"
     But I shouldn't see orders from: "<invisible_orders>"
  Examples:
    | filter_name                              | filter_value                     | visible_orders                          | invisible_orders                                                                 |
    | service                                  | Поизлучать излучение Хоккинга    | client3@exmaple.com client4@exmaple.com | client1@exmaple.com client2@exmaple.com                                          |
    | status                                   | close                            | client5@exmaple.com                     |  client1@exmaple.com client2@exmaple.com client3@exmaple.com client4@exmaple.com |
#    | emails:'client4@exmaple.com'                     |  client4@exmaple.com                    |  client1@exmaple.com client2@exmaple.com client3@exmaple.com client5@exmaple.com |

  @javascript
  Scenario: Change status
    When I go to "/partner"
    And I click on "Управление заказами"
    And I change status on order "client3@exmaple.com" to "close"
    Then order from "client3@exmaple.com" has status "close"

