Feature: Add services to main slider on main page

  Scenario:
    Given a service "add to slider"
      And I signed in as admin
    When I go to "/admin/services"
     And I click to edit service  "add to slider"
     And I set "Отображать в слайдере" as true
     And I submit form "edit_service"
     And I go to "/"
    Then I should see service "add to slider" on slider
