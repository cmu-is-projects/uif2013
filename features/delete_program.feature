Feature: Deleting a program

Background:
	Given I am logged in as administrator
	Given an initial setup
    Given some programs and events 
	When I go to the new program page

		
	Scenario: Delete a program
        When I am on on the "Soccer" program page
        And I should see "Add a Note"
        And I click the button "Destroy this program"
        Then I should see a javascript message "Are you sure?"
        And I click "OK"
        Then I should see "Current Programs" without "Soccer"
        And I should see "Past Programs"

    Scenario: Cancel deleting a program
        When I am on on the "Soccer" program page
        And I should see "Add a Note"
        And I click the button "Destroy this program"
        Then I should see a javascript message "Are you sure?"
        And I click "Cancel"
        Then I should see the "Soccer" program page
        And I should see "Add a Note"
