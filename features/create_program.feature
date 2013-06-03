Feature: Creating a new program

Background:
	Given I am logged in as administrator
	Given an initial setup
	When I go to the new program page
		
	Scenario: Adding a new program works
	    When I fill in "Name" with "Chess"
        And I select "Athletics" from "program_department_id"
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program"
        Then I should see "Program was successfully created"
        Then I should see "Add a Note"

    Scenario: Name field is missing
        When I fill in "Name" with ""
        And I select "Athletics" from "program_department_id"
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program"
        Then I should see "can't be blank"
  
   Scenario: Department field is missing
        When I fill in "Name" with "Chess"
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program"
        Then I should see "can't be blank" 
   
   Scenario: Min grade field is missing
        When I fill in "Name" with "Chess"
        And I select "Athletics" from "program_department_id" 
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program"
        Then I should see "can't be blank" 
   
   Scenario: Max grade field is missing
     When I fill in "Name" with "Chess"
        And I select "Athletics" from "program_department_id" 
        And I select "4" from "program_min_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program"
        Then I should see "can't be blank" 
   
   Scenario: Max capacity field is missing
        When I fill in "Name" with "Chess"
        And I select "Athletics" from "program_department_id" 
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with ""
        And I click the button "Create Program"
        Then I should see "can't be blank" 
   
   Scenario: Program has the same name of an existing program
        Given some programs and events
        When I fill in "Name" with "Soccer"
        And I select "Athletics" from "program_department_id" 
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program" 
        Then I should see "name is already in use" 
   
   Scenario: End date is before start date
        When I fill in "Name" with "Chess"
        And I select "Athletics" from "program_department_id" 
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I select "May" from "program_start_date_2i" 
        And I select "14" from "program_start_date_3i" 
        And I select "2013" from "program_start_date_1i" 
        And I select "March" from "program_end_date_2i" 
        And I select "11" from "program_end_date_3i" 
        And I select "2012" from "program_end_date_1i" 
        And I click the button "Create Program" 
        Then I should see "must be after the start of the program" 

   Scenario: Cancel creating a program
      # When I am on "the Soccer page"
      # And I should see "Add a Note"
      # Then I click on the button "Edit this program"
        When I fill in "Name" with "Chess"
        And I select "Athletics" from "program_department_id" 
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        When I click on the link "Cancel"
        And I should be on "the program index page"
        Then I should see "Current Programs"
      # And I should see "Past Programs"



