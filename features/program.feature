
# Feature: Creating a new program

# Background:
# 	Given I am logged in as administrator
# 	Given an initial setup
#   # Given some programs and events 
# 	When I go to the new program page
#   # And I am able to enter my program details

		
# 	Scenario: Adding a new program works
# 	  When I fill in "Name" with "Chess"
#     # Then show me the page
#     And I select "Athletics" from "program_department_id"
#     And I select "4" from "program_min_grade"
#     And I select "9" from "program_max_grade"
#     And I fill in "Max capacity" with "60"
#     And I click the button "Create Program"
#     Then I should see "Program was successfully created"
#     Then I should see "Add a Note"
		
#   # Scenario: Name field is missing
#   #   When I fill in "Name" with ""
#   #   And I select "Athletics" under the "Department" field
#   #   And I select "4" under the "Min grade" field
#   #   And I select "9" under the "Max grade" field
#   #   And I fill in "Max capacity" with "60"
#   #   And I click the button "Create Program" 
#   #   Then I should see "can't be blank" next to the "Name" field
#   # 
#   # Scenario: Department field is missing
#   #   When I fill in "Name" with "Basketball"
#   #   And I select "" under the "Department" field
#   #   And I select "4" under the "Min grade" field
#   #   And I select "9" under the "Max grade" field
#   #   And I fill in "Max capacity" with "60"
#   #   And I click the button "Create Program" 
#   #   Then I should see "can't be blank" next to the "Department" field
#   # 
#   # Scenario: Min grade field is missing
#   #   When I fill in "Name" with "Basketball"
#   #   And I select "Athletics" under the "Department" field
#   #   And I select "" under the "Min grade" field
#   #   And I select "9" under the "Max grade" field
#   #   And I fill in "Max capacity" with "60"
#   #   And I click the button "Create Program" 
#   #   Then I should see "can't be blank" next to the "Min grade" field
#   # 
#   # Scenario: Max grade field is missing
#   #   When I fill in "Name" with "Basketball"
#   #   And I select "Athletics" under the "Department" field
#   #   And I select "4" under the "Min grade" field
#   #   And I select "" under the "Max grade" field
#   #   And I fill in "Max capacity" with "60"
#   #   And I click the button "Create Program" 
#   #   Then I should see "can't be blank" next to the "Max grade" field
#   # 
#   # Scenario: Max capacity field is missing
#   #   When I fill in "Name" with "Basketball"
#   #   And I select "Athletics" under the "Department" field
#   #   And I select "4" under the "Min grade" field
#   #   And I select "9" under the "Max grade" field
#   #   And I fill in "Max capacity" with ""
#   #   And I click the button "Create Program" 
#   #   Then I should see "can't be blank" next to the "Max capacity" field
#   # 
#   # Scenario: Program has the same name of an existing program
#   #   When I fill in "Name" with "Soccer"
#   #   And I select "Athletics" under the "Department" field
#   #   And I select "4" under the "Min grade" field
#   #   And I select "9" under the "Max grade" field
#   #   And I fill in "Max capacity" with "60"
#   #   And I click the button "Create Program" 
#   #   Then I should see "name is already in use" next to the "Name" field
#   # 
#   # Scenario: End date is before start date
#   #   When I fill in "Name" with "Basketball"
#   #   And I select "Athletics" under the "Department" field
#   #   And I select "4" under the "Min grade" field
#   #   And I select "9" under the "Max grade" field
#   #   And I fill in "Max capacity" with "60"
#   #   And I select "May 20, 2013" under the "Start date" field
#   #   And I select "March 11, 2012" under the "End date" field
#   #   And I click the button "Create Program" 
#   #   Then I should see "must be after the start of the program" next to the "End date" field
#   # 
#   # Scenario: Delete a program
#   #   When I am on on the programs page
#   #   Then I should see a list of current and past programs
#   #   When I click on the program link 'Soccer'
#   #   Then I should see a button "Destroy this program"
#   #   When I click the button "Destroy this program"
#   #   Then I should see a javascript message "Are you sure?"
#   #   And I click "OK"
#   #   Then I should see a list of locations without "Soccer"
#   # 
#   # Scenario: Edit old program
#   #   When I am on the "Soccer" program page
#   #   And I want to edit a detail
#   #   Then I click on the button "Edit this program"
#   #   And after making the change I click the button "Update this program"
#   #   Then I should the "Soccer" program page with the updated changes
#   # 
#   # Scenario: Return to program page
#   #   When I am on the "Soccer" program page
#   #   Then I should see a button "Back to programs"
#   #   When I click the button "Back to programs"
#   #   Then I should see a list of programs


