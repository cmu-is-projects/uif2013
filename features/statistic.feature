Feature: Searching statistics

Background:
	Given I am logged in as administrator
	When I go to the Statistics
	#And I have selected year
	#And I have seleced month
	#And I have clicked on the Search button
	Then I am able to view the statistics

	Scenario: Year is in the future
		 # When I select "" under the "Program" field 
		 # And I fill in "Name" with "Soccer1"
		 # And I fill in "Max capacity" with "11"
		 # And I click the checkbox "Active" 
		 # And I click the "Create Section" button
		 # Then I should see "Program is missing"

	Scenario: Successful search for statistics
		 # When I select "" under the "Program" field 
		 # And I fill in "Name" with "Soccer1"
		 # And I fill in "Max capacity" with "11"
		 # And I click the checkbox "Active" 
		 # And I click the "Create Section" button
		 # Then I should see "Program is missing"