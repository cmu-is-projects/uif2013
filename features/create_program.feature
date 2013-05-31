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
        And I select "Athletics" from "program_department_id" field
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program"
        Then I should see "can't be blank" next to the "program_name" field
  
   Scenario: Department field is missing
        When I fill in "Name" with "Chess"
        And I select "" from "program_department_id" field
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program"
        Then I should see "can't be blank" next to the "program_department_id" field
   
   Scenario: Min grade field is missing
        When I fill in "Name" with "Chess"
        And I select "Athletics" from "program_department_id" field
        And I select "" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program"
        Then I should see "can't be blank" next to the "program_min_grade" field
   
   Scenario: Max grade field is missing
     When I fill in "Name" with "Chess"
        And I select "Athletics" from "program_department_id" field
        And I select "4" from "program_min_grade"
        And I select "" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program"
        Then I should see "can't be blank" next to the "program_max_grade" field
   
   Scenario: Max capacity field is missing
        When I fill in "Name" with "Chess"
        And I select "Athletics" from "program_department_id" field
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with ""
        And I click the button "Create Program"
        Then I should see "can't be blank" next to the "program_max_capacity" field
   
   Scenario: Program has the same name of an existing program
        When I fill in "Name" with "Soccer"
        And I select "Athletics" from "program_deapartment_id" field
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I click the button "Create Program" 
        Then I should see "name is already in use" next to the "program_name" field
   
   Scenario: End date is before start date
        When I fill in "Name" with "Chess"
        And I select "Athletics" under the "program_department_id" field
        And I select "4" from "program_min_grade"
        And I select "9" from "program_max_grade"
        And I fill in "Max capacity" with "60"
        And I select "May" from "program_start_date_2i" field
        And I select "14" from "program_start_date_3i" field
        And I select "2013" from "program_start_date_1i" field
        And I select "March" from "program_end_date_2i" field
        And I select "11" from "program_end_date_3i" field
        And I select "2017" from "program_end_date_1i" field
        And I click the button "Create Program" 
        Then I should see "must be after the start of the program" next to the "program_end_date" field

   Scenario: Cancel creating a program
        When I fill in "Name" with "Chess"
        And I select "Athletics" from "program_department_id" field
        When I click the button "Cancel"
        Then I should see "Current Programs"
        And I should see "Past Programs"


