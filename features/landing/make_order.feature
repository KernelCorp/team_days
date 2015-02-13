Feature: Make order


  Background:
    Given a service "Выпить чаю"

  @javascript
  Scenario: Make order without binding service
    When I go to "/"
    And I fill in "order[client_info][name]" as "client_1" within ".first_form"
    And I fill in "order[client_info][phone]" as "11111111111" within ".first_form"
    And I fill in "order[client_info][email]" as "new@email.com" within ".first_form"
    And I submit the ".first_form"
#    Then I should see text "Данные успешно изменены"
    Then Order without service should be exist



  @javascript
  Scenario: Make order with binding service
    When I go to "/"
    And I click on button "button" on the slider: "showcase_services"
    And I fill in "order[client_info][name]" as "client_1" within "#modal_form"
    And I fill in "order[client_info][phone]" as "11111111111" within "#modal_form"
    And I fill in "order[client_info][email]" as "new@email.com" within "#modal_form"
    And I submit the "#modal_form"
  #    Then I should see text "Данные успешно изменены"
    Then Order with service: "Выпить чаю" should be exist
