Feature: Login to LuckyBolt

    As an user of Luckybolt
    So that I can view my account
    I want to login
    
    Background:
        Given the following user accounts exist
        | password | password_confirmation | role     | email   |
        | aaaaaaaa | aaaaaaaa              | admin    | c@b.com |
        | bbbbbbbb | bbbbbbbb              | vendor   | b@c.com |
        | cccccccc | cccccccc              | customer | t@g.com |
        | dddddddd | dddddddd              | server   | g@h.com |
           
    Scenario: Admin login to LuckyBolt
        Given I am on the home page
        And I follow "Login"
        Then I should be on the login page
        And I fill in "user_email" with "c@b.com"
        And I fill in "user_password" with "aaaaaaaa"
        And I press "Sign in"
        Then I should see "Signed in successfully"
        
    Scenario: Vendor login to LuckyBolt
        Given I am on the home page
        And I follow "Login"
        Then I should be on the login page
        And I fill in "user_email" with "b@c.com"
        And I fill in "user_password" with "bbbbbbbb"
        And I press "Sign in"
        Then I should see "Signed in successfully"
  
    Scenario: Customer login to LuckyBolt
        Given I am on the home page
        And I follow "Login"
        Then I should be on the login page
        And I fill in "user_email" with "t@g.com"
        And I fill in "user_password" with "cccccccc"
        And I press "Sign in"
        Then I should see "Signed in successfully"
       
    Scenario: Server login to LuckyBolt
        Given I am on the home page
        And I follow "Login"
        Then I should be on the login page
        And I fill in "user_email" with "g@h.com"
        And I fill in "user_password" with "dddddddd"
        And I press "Sign in"
        Then I should see "Signed in successfully"