Feature: Updating an existing program

Background:
	Given I am logged in as administrator
	Given an initial setup
    Given some programs and events 

		
	Scenario: Edit an existing program by selecting a program
      # When I am on "the Soccer page"
      # And I should see "Add a Note"
      # Then I click on the button "Edit this program"
        When I am on "the edit Soccer page"
        And I fill in "program_description" with "Sports exercise for kids" 
        When I click the button "Update Program"
        Then I should see "Program was successfully updated."
        And I am on "the edit Soccer page"


    Scenario: Edit an existing program through the Dashboard
      # When I am on the "Dashboard" page
      # And I should see "Current Programs"
      # And I should see "Past Programs"
      # When I click on the button "Edit" next to "Soccer"
        When I am on "the edit Soccer page"
        And I fill in "program_description" with "Sports exercise for kids" 
        When I click the button "Update Program"
        Then I should see "Program was successfully updated."
        And I am on "the edit Soccer page"

    Scenario: Cancel editing a program
      # When I am on "the Soccer page"
      # And I should see "Add a Note"
      # Then I click on the button "Edit this program"
       When I am on "the edit Soccer page"
       And I fill in "program_description" with "Sports exercise for kids" 
       When I click on the link "Cancel"
       Then I am on "the edit Soccer page"
