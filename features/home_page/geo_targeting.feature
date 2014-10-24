Feature: Geo targeting on the main page
  In order to redirect guest to partner's site

 Background:
   Given a partner from "Novosibirsk" with domain: "nsk", email: "partner@example.com"
   Given a partner from "Ru Moscow" with domain: "msk", email: "partner2@example.com"
 @javascript
 Scenario: Redirect after approve city
   Given I am in "Novosibirsk"
   When I go to "/"
   Then I should see modal windows with text "Выберете город"
   When I click to ".button", "ВЫБРАТЬ"
   Then I should be redirected to subdomain "nsk"

 @javascript
 Scenario: Select other city
   Given I am in "Novosibirsk"
   When I go to "/"
    And I select city "Ru Moscow"
    And I click to ".button", "ВЫБРАТЬ"
   Then I should be redirected to subdomain "msk"