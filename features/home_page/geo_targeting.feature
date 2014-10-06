Feature: Geo targeting on the main page
  In order to redirect guest to partner's site

 Background:
   Given a partner from "Novosibirsk" with domain: "nsk", email: "partner@example.com"
   Given a partner from "Moscow" with domain: "msk", email: "partner2@example.com"

 Scenario: Redirect after approve city
   Given I am in "Novosibirsk"
   When I go to "/"
   Then I should see modal windows with text "Мы определили что вы находитесь в Новосибирске, это так?"
   When I click to "Да"
   Then I should be redirected to subdomain "nsk"

 Scenario: Select other city
   Given I am in "Novosibirsk"
   When I go to "/"
    And I select city "Moscow"
   Then I should be redirected to subdomain "msk"