Feature: Creating a new household

Background:
	Given I am logged in as administrator
	When I visit the page Dashboard
	And I have clicked on the button Add Household
	And I am able to enter my household details

	Scenario: Zipcode number is too short
		And I fill in "Name" with "Fairfax Apartments"
		And I fill in "Street" with "4614 Fifth Ave"
		And I fill in "City" with "Pittsburgh"
		When I fill in "Zip" with "1527"
		And I click the checkbox "Active"
		And I click the button "Create Location" 
		Then I should see "Zip code should be five digits long"
		
	Scenario: Name field is missing
	    And I fill in "Name" with ""
	    And I fill in "Street" with "4614 Fifth Ave"
		And I fill in "City" with "Pittsburgh"
		When I fill in "Zip" with "15271"
		And I click the checkbox "Active"
		And I click the button "Create Location" 
		Then I should see "Name field is required"

	Scenario: Street field is missing
	 And I fill in "Name" with "Fairfax Apartments"
	    And I fill in "Street" with ""
		And I fill in "City" with "Pittsburgh"
		When I fill in "Zip" with "15271"
		And I click the checkbox "Active"
		And I click the button "Create Location" 
		Then I should see "Street field is required"

	Scenario: City field is missing
		And I fill in "Name" with "Fairfax Apartments"
	    And I fill in "Street" with "4614 Fifth Ave"
		And I fill in "City" with ""
		When I fill in "Zip" with "15271"
		And I click the checkbox "Active"
		And I click the button "Create Location" 
		Then I should see "City field is required"

	Scenario: Zip code field is missing
	 	And I fill in "Name" with "Fairfax Apartments"
	    And I fill in "Street" with "4614 Fifth Ave"
		And I fill in "City" with "Pittsburgh"
		When I fill in "Zip" with ""
		And I click the checkbox "Active"
		And I click the button "Create Location" 
		Then I should see "Zip code field is required"

	Scenario: Longitude value is not an integer
	 	And I fill in "Name" with "Fairfax Apartments"
	    And I fill in "Street" with "4614 Fifth Ave"
		And I fill in "City" with "Pittsburgh"
		When I fill in "Zip" with "15271"
		And I click the checkbox "Active"
		And I click the button "Create Household" 
		Then I should see "Location already exists"




