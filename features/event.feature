Feature: Creating a new event

Background:
	Given I am logged in as administrator
	When I go to the Dashboard
	And I have clicked on the Add Event
	Then I am able to enter my event details

	Scenario: Event date is in the past
		 When I select "" as the date 
		 And I select "Baseball" from "Program"
		 And I select 
		# And I fill in "Street" with "4614 Fifth Ave"
		# And I fill in "City" with "Pittsburgh"
		# And I fill in "Zip" with "1527"
		# And I click the checkbox "Active"
		# And I click the "Create Location" button
		# Then I should see "Zip code should be five digits long"

	Scenario: Program is missing
		# When I fill in "Date" with "Fairfax Apartments"
		# And I fill in "Street" with "4614 Fifth Ave"
		# And I fill in "City" with "Pittsburgh"
		# And I fill in "Zip" with "1527"
		# And I click the checkbox "Active"
		# And I click the "Create Location" button
		# Then I should see "Zip code should be five digits long"

	Scenario: End time is before start time
		# When I fill in "Date" with "Fairfax Apartments"
		# And I fill in "Street" with "4614 Fifth Ave"
		# And I fill in "City" with "Pittsburgh"
		# And I fill in "Zip" with "1527"
		# And I click the checkbox "Active"
		# And I click the "Create Location" button
		# Then I should see "Zip code should be five digits long"

	Scenario: Location is missing
		# When I fill in "Date" with "Fairfax Apartments"
		# And I fill in "Street" with "4614 Fifth Ave"
		# And I fill in "City" with "Pittsburgh"
		# And I fill in "Zip" with "1527"
		# And I click the checkbox "Active"
		# And I click the "Create Location" button
		# Then I should see "Zip code should be five digits long"

	Scenario: Meals served is missing
		When I fill in "Date" with "Fairfax Apartments"
		And I fill in "Street" with "4614 Fifth Ave"
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "1527"
		And I click the checkbox "Active"
		And I click the "Create Location" button
		Then I should see "Zip code should be five digits long"

	Scenario: Bibles distributed is missing
		When I fill in "Date" with "Fairfax Apartments"
		And I fill in "Street" with "4614 Fifth Ave"
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "1527"
		And I click the checkbox "Active"
		And I click the "Create Location" button
		Then I should see "Zip code should be five digits long"

