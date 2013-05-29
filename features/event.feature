Feature: Creating a new event

Background:
	Given I am logged in as administrator
	When I go to the Dashboard
	And I have clicked on the Add Event
	Then I am able to enter my event details

	Scenario: Event date is in the past
		# When I select "" as the date 
		 And I select "Baseball" under the "Program" field
		# And I select "" under the "Start time" field
		# And I select "" under the "End time" field
		 And I select "Carnegie Mellon" under the "Location" field
		 And I fill in "Meals served" with "0" 
		 And I fill in "Bibles distributed" with "0" 
		 And I click the "Create Event" button
		# Then I should see ""

	Scenario: Program is missing
		# When I select "" as the date 
		 And I select "" under the "Program" field
		# And I select "" under the "Start time" field
		# And I select "" under the "End time" field
		 And I select "Carnegie Mellon" under the "Location" field
		 And I fill in "Meals served" with "0" 
		 And I fill in "Bibles distributed" with "0" 
		 And I click the "Create Event" button
		# Then I should see "is not a valid number" next to the "Program" field
		

	Scenario: End time is before start time
		# When I select "" as the date 
		 And I select "" under the "Program" field
		# And I select "" under the "Start time" field
		# And I select "" under the "End time" field
		 And I select "Carnegie Mellon" under the "Location" field
		 And I fill in "Meals served" with "0" 
		 And I fill in "Bibles distributed" with "0" 
		 And I click the "Create Event" button
		 Then I should see "must be after the start of the event" next to the "End time" field

	Scenario: Location is missing
		# When I select "" as the date 
		 And I select "Baseball" under the "Program" field
		# And I select "" under the "Start time" field
		# And I select "" under the "End time" field
		 And I select "" under the "Location" field
		 And I fill in "Meals served" with "0" 
		 And I fill in "Bibles distributed" with "0" 
		 And I click the "Create Event" button
		# Then I should see "is not a valid number" next to the "Location" field


	Scenario: Meals served is missing
		# When I select "" as the date 
		 And I select "Baseball" under the "Program" field
		# And I select "" under the "Start time" field
		# And I select "" under the "End time" field
		 And I select "Carnegie Mellon" under the "Location" field
		 And I fill in "Meals served" with "" 
		 And I fill in "Bibles distributed" with "0" 
		 And I click the "Create Event" button
		 Then I should see "is not a valid number" next to the "Meals served" field

	Scenario: Bibles distributed is missing
		# When I select "" as the date 
		 And I select "Baseball" under the "Program" field
		# And I select "" under the "Start time" field
		# And I select "" under the "End time" field
		 And I select "Carnegie Mellon" under the "Location" field
		 And I fill in "Meals served" with "0" 
		 And I fill in "Bibles distributed" with "" 
		 And I click the "Create Event" button
		 Then I should see "is not a valid number" next to the "Bibles distributed" field