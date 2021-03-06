Feature: see all the users

    As an admin
    So that I can manage all users
    I want to see all the users of my site
    
    Background:
        Given the admin account is set up
        And a non admin account is set up
        And the following user accounts exist
        | password | password_confirmation | role     | email   | first_name | last_name | phone_number |
        | aaaaaaaa | aaaaaaaa              | admin    | r@b.com | a          | b         | 1 123 123-1231 |
        | bbbbbbbb | bbbbbbbb              | vendor   | q@b.com | a          | b         | 1 123 123-1231 |
        | cccccccc | cccccccc              | customer | d@b.com | a          | b         | 1 123 123-1231 |
    
    Scenario: admin should see all users
        Given I am logged in with an admin account
        And I am on the users page
        Then I should see "Admin"
        And I should see "Vendor"
        And I should see "Customer"
        And I should see "r@b.com"
        And I should see "q@b.com"
        And I should see "d@b.com"
        
    Scenario: non admins should not see all users
        Given I am logged in with a user account
        And I am on the users page
        Then I should be on the home page

    Scenario: guests should not see all users
        Given I am on the users page
        Then I should be on the home page