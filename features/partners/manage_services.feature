Feature: Service managing
  In order to a partner can enable\disable services

  Scenario: disable service
    Given a service with name "Коллапсировать сверхновую звезду в черную дыру"
      And a service with name "Поизлучать излучение Хоккинга"
      And a services box "Юный астроном" with services: "Коллапсировать сверхновую звезду в черную дыру", "Поизлучать излучение Хоккинга"
      And a partner from "Сколково" with email: "partner@example.com"
      And a services box "Юный астроном" available for partner "partner@example.com"
      And I signed in as partner with email "partner@example.com"
    When I go to "/partner"
     And I click on "Управление Услугами"
     And I disable service "Поизлучать излучение Хоккинга"
#     And I go to "/"
#    Then I should see service "Коллапсировать сверхновую звезду в черную дыру"
#     But I shouldn't see service "Поизлучать излучение Хоккинга"
