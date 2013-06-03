Feature: Updating an existing student

Background:
	Given I am logged in as administrator
	Given an initial setup
    Given some students

		
	Scenario: Edit an existing student by selecting a student
      # When I am on "the Alex Heimann page"
      # And I should see "Add a Note"
      # Then I click on the button "Edit this student"
        When I am on "the edit Alex Heimann page"
        And I fill in "First name" with "Alexander Heimann (the man)" 
        When I click the button "Update Student"
        Then I should see "Student was successfully updated."
        And I am on "the edit Alex Heimann page"


    Scenario: Edit an existing student through the Dashboard
      # When I am on the "Dashboard" page
      # And I should see "Students"
      # When I click on the button "Edit" next to "Heimann, Alex"
        When I am on "the edit Alex Heimann page"
        And I fill in "First name" with "Alexander Heimann (the man)" 
        When I click the button "Update Student"
        Then I should see "Student was successfully updated."
        And I am on "the edit Alex Heimann page"

    Scenario: Cancel editing a program
      # When I am on "the Alex Heimann page"
      # And I should see "Add a Note"
      # Then I click on the button "Edit this student"
       When I am on "the edit Alex Heimann page"
       And I fill in "First name" with "Alexander Heimann (the man)" 
       When I click on the link "Cancel"
       Then I am on "the edit Alex Heimann page"
