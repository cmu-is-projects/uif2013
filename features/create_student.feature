Feature: Creating a new student

Background:
	Given I am logged in as administrator
	Given an initial setup
	When I go to the new student page
		
	Scenario: Adding a new program works
	    When I fill in "Name" with "Chess"
        And I select "Athletics" from "program_department_id"
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program"
        Then I should see "Program was successfully created"
        Then I should see "Add a Note"