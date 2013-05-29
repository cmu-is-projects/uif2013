Feature: Creating a new household

Background:
	Given I am logged in as administrator
	When I visit the page Dashboard
	And I have clicked on the button Add Household
	And I am able to enter my household details

		
	Scenario: Name field is missing
	    When I fill in "Name" with ""
	    And I fill in "Street" with "1212 Here Street"
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "15271"
		And I click the checkbox "Active"
		And I click the button "Create Household" 
		Then I should see "can't be blank" next to the "Name" field

	Scenario: Street field is missing
		When I fill in "Name" with "Turner"
	    And I fill in "Street" with ""
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "15271"
		And I click the checkbox "Active"
		And I click the button "Create Household" 
		Then I should see "can't be blank" next to the "Street" field

	Scenario: City field is missing
		When I fill in "Name" with "Turner"
	    And I fill in "Street" with "1212 Here Street"
		And I fill in "City" with ""
		And I fill in "Zip" with "15271"
		And I click the checkbox "Active"
		And I click the button "Create Household" 
		Then I should see "can't be blank" next to the "City" field

	Scenario: Zip code field is missing
	 	When I fill in "Name" with "Turner"
	    And I fill in "Street" with "1212 Here Street"
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with ""
		And I click the checkbox "Active"
		And I click the button "Create Household" 
		Then I should see "should be five digits long" next to the "Zip Code" field 

	Scenario: Zip code number is too short
		When I fill in "Name" with "Turner"
		And I fill in "Street" with "1212 Here Street"
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "1527"
		And I click the checkbox "Active"
		And I click the button "Create Household" 
		Then I should see "should be five digits long" next to the "Zip Code" field 

	Scenario: Longitude value is not an integer
	 	When I fill in "Name" with "Turner"
	    And I fill in "Street" with "1212 Here Street"
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "15271"
		When I fill in "Lat" with "bad"
		And I click the checkbox "Active"
		And I click the button "Create Household" 
		Then I should see "Latitude should be an integer"

	Scenario: Longitude value is not an integer
	 	When I fill in "Name" with "Turner"
	    And I fill in "Street" with "1212 Here Street"
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "15271"
		When I feill in "Lon" with "bad"
		And I click the checkbox "Active"
		And I click the button "Create Household" 
		Then I should see "Longitude should be an integer"

	Scenario: Delete old household
		When I am on on the households page
		Then I should see a list of current locations
		When I click on the location link 'Smith'
		Then I should see a button "Destroy this household"
		When I click the button "Destroy this household"
		Then I should see a javascript message "Are you sure?"
		And I click "OK"
		Then I should see a list of locations without "Smith"

	Scenario: Edit old household
		When I am on the "Smith" household page
		And I want to edit a detail
		Then I click on the button "Edit this household"
		And after making the change I click the button "Update this household"
		Then I should the "Smith" household page with the updated changes

	Scenario: Return to household page
		When I am on the "Smith" household page
		Then I should see a button "Back to households"
		When I click the button "Back to households"
		Then I should see a list of households


