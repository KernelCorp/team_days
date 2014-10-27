Feature: Blog

  Background:
    Given a category "Мясо"
      And a category "Рыба"
      And a post in the category "Мясо" with title "Два вегетарианца съели кусок мяса" with tags: "жесть, смотреть до конца, котики"
      And a post in the category "Рыба" with title "Две рыбы съели кусок вегетарианца" with tags: "жесть, православные активисты"
      And a post in the category "Рыба" with title "Две рыбы съели кусок мяса" with tags: "ios"

    Scenario: Show posts in a category
      When I go to "/blog"
       And I select category "Мясо"
      Then I should see post with title "Два вегетарианца съели кусок мяса"
       But I shouldn't see post with title "Две рыбы съели кусок вегетарианца"
       And I shouldn't see post with title "Две рыбы съели кусок мяса"
    @javascript
    Scenario: Search by tags
      When I visit post with title "Два вегетарианца съели кусок мяса"
       And I click on tag "жесть"
      Then I should see post with title "Два вегетарианца съели кусок мяса"
       And I should see post with title "Две рыбы съели кусок вегетарианца"
       But I shouldn't see post with title "Две рыбы съели кусок мяса"

    Scenario: Notification about new posts
      Given an email "looser@example.com" has subscription on new posts in category "Мясо"
      When a new post in category "Мясо" was created
       And a new post in category "Рыба" was created
      Then "looser@example.com" should receive an email