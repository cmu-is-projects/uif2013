Feature: Creating a new section

Background:
	Given I am logged in as administrator
	When I go to the Dashboard
	And I have clicked on the Add Section
	Then I am able to enter my section details

	Scenario: Program is missing
		 When I select "" under the "Program" field 
		 And I fill in "Name" with "Soccer1"
		 And I fill in "Max capacity" with "11"
		 And I click the checkbox "Active" 
		 And I click the "Create Section" button
		 Then I should see "Program is missing" next to the "Program" field

	Scenario: Name is missing
		 When I select "Performing Arts Academy" under the "Program field"
		 And I fill in "Name" with ""
		 And I fill in "Max capacity" with "11"
		 And I click the checkbox "Active" 
		 And I click the "Create Section" button
		 Then I should see "can't be blank" next to the "Name" field

	Scenario: Max capacity is in an improper format
		 When I select "Performing Arts Academy" under the "Program field"
		 And I fill in "Name" with "Shakespeare"
		 And I fill in "Max capacity" with "bad"
		 And I click the checkbox "Active" 
		 And I click the "Create Section" button
		 Then I should see "must be greater than 1" next to the "Max capacity" field

