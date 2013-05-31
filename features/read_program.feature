Feature: Reading an existing program

Background:
	Given I am logged in as administrator
	Given an initial setup
    Given some programs and events 
	When I click on an existing program
    Then I am able to enter program details

		
	Scenario: Reading an existing program
        When I am on the "Soccer" program page
        And I should see "Add a Note"
        And I should see the button "Back to programs"
        And I should see the button "Edit this page"
        And I should see the button "Destroy this program"
    
    Scenario: Return to program page
        When I am on the "Soccer" program page
        And I should see "Add a Note"
        Then I should see a button "Back to programs"
        When I click the button "Back to programs"
        Then I should see "Current Programs"
        And I should see "Past Programs"