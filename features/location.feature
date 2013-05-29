Feature: Creating a new location

Background:
	Given I am logged in as administrator
	When I go to the Dashboard
	And I have clicked on the Add Location
	Then I am able to enter my location details

	Scenario: Zipcode number is too short
		When I fill in "Name" with "Fairfax Apartments"
		And I fill in "Street" with "4614 Fifth Ave"
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "1527"
		And I click the checkbox "Active"
		And I click the "Create Location" button
		Then I should see "Zip code should be five digits long"
	
	Scenario: Name field is missing
	   	When I fill in "Name" with ""
	   	And I fill in "Street" with "4614 Fifth Ave"
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "15271"
		And I click the checkbox "Active"
		And I click the "Create Location" button
		Then I should see "Name field is required"

	Scenario: Street field is missing
		When I fill in "Name" with "Fairfax Apartments"
	   	And I fill in "Street" with ""
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "15271"
		And I click the checkbox "Active"
		And I click the "Create Location" button
		Then I should see "Street field is required"

	Scenario: City field is missing
		When I fill in "Name" with "Fairfax Apartments"
		And I fill in "Street" with "4614 Fifth Ave"
		And I fill in "City" with ""
		And I fill in "Zip" with "15271"
		And I click the checkbox "Active"
		And I click the "Create Location" button
		Then I should see "City field is required"

	Scenario: Duplicate a location
		When I fill in "Name" with "CMU"
		And I fill in "Street" with "5000 Forbes Ave"
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "15271"
		And I click the checkbox "Active"
		And I click the "Create Location" button
		Then I should see "Location already exists"

	Scenario: Cancel new location
	
	Scenario: Delete old location