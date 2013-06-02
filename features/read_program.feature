Feature: Reading an existing program

Background:
	Given I am logged in as administrator
	Given an initial setup
    Given some programs and events 

		
	Scenario: Reading an existing program
        When I go to "the Soccer page"
        Then I should see "Add a Note"
        And I should see "Soccer"
        And I should see "Soccer Intramural Sports"
        And I should see "Athletics"
        And I should see "6 - 9"
        And I should see "75"
        And I should see "February 02, 2013"
        And I should see "N/A"
        And I should see "false"
    
    Scenario: Return to program page
        When I go to "the Soccer page"
        Then I should see "Add a Note"
      # When I click on the button "icon-backward  Back to programs"
      # Then I should see "Current Programs"
      # And I should see "Past Programs"