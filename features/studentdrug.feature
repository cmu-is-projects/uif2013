Feature: Creating a new student drug assignment

Background:
	Given I am logged in as administrator
	When I go to the Dashboard
	And I have clicked on the Add Event
	Then I am able to enter my event details

	Scenario: Student is missing
		 When I fill in "Name" with ""
		 And I fill in "Drug" with "Tylenol" 
		 And I fill in "Dosage" with "2"
		 And I click the "Create" button
		 Then I should see "" next to the "Program" field
		

	Scenario: Drug is missing
		 When I fill in "Date" with "05/01/2013"
		 And I select "Baseball" under the "Program" field
		 And I fill in "12:00pm" with "Start time"
		 And I fill in "9:pm" with "End time"
		 And I select "Carnegie Mellon" under the "Location" field
		 And I fill in "Meals served" with "0" 
		 And I fill in "Bibles distributed" with "0" 
		 And I click the "Create Event" button
		 Then I should see "must be after the start of the event" next to the "End time" field

	Scenario: Dosage is invalid
		 When I fill in "Date" with "05/01/2013"
		 And I select "Baseball" under the "Program" field
		 And I fill in "12:00pm" with "Start time"
		 And I fill in "9:pm" with "End time"
		 And I select "" under the "Location" field
		 And I fill in "Meals served" with "0" 
		 And I fill in "Bibles distributed" with "0" 
		 And I click the "Create Event" button
		 Then I should see "must enter location" next to the "Location" field


	Scenario: Meals served is missing
		 When I fill in "Date" with "05/01/2013"
		 And I select "Baseball" under the "Program" field
		 And I fill in "12:00pm" with "Start time"
		 And I fill in "2:00pm" with "End time"
		 And I select "Carnegie Mellon" under the "Location" field
		 And I fill in "Meals served" with "" 
		 And I fill in "Bibles distributed" with "0" 
		 And I click the "Create Event" button
		 Then I should see "is not a valid number" next to the "Meals served" field

	Scenario: Bibles distributed is missing
		 When I fill in "Date" with "05/01/2013"
		 And I select "Baseball" under the "Program" field
		 And I fill in "12:00pm" with "Start time"
		 And I fill in "2:00pm" with "End time"
		 And I select "Carnegie Mellon" under the "Location" field
		 And I fill in "Meals served" with "0" 
		 And I fill in "Bibles distributed" with "" 
		 And I click the "Create Event" button
		 Then I should see "is not a valid number" next to the "Bibles distributed" field