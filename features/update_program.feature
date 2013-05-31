Feature: Updating an existing program

Background:
	Given I am logged in as administrator
	Given an initial setup
    Given some programs and events 
	When I click on an existing program
    Then I am able to enter program details

		
	Scenario: Edit an existing program
        When I am on the "Soccer" program page
        And I should see "Add a Note"
        Then I click on the button "Edit this program"
        I should see "Edit Program"
        And I fill in "program_description_id" with "Sports exercise for kids" 
        And after making the change I click the button "Update this program"
        Then I should see "Program was successfully updated."
        And I should see "Current Programs"
        And I should see "Past Programs"

    Scenario: Cancel editing a program
        When I am on the "Soccer" program page
        And I should see "Add a Note"
        Then I click on the button "Edit this program"
        I should see "Edit Program"
        And I fill in "program_description_id" with "Sports exercise for kids" 
        When I click the button "Cancel"
        Then I should see "Current Programs"
        And I should see "Past Programs"