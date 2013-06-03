Feature: Creating a new event

As an administrator, I want to create a new event in order to keep a record of new event.

Background:
  Given I am logged in as administrator
  Given an initial setup
  Given some programs and events

	Scenario: Adding a new event that works from dashboard
		Given I go to "the Dashboard"
		And I click the button "Add New Event"
		Then I select "Choir" from "event_program_id"
		And I select "CMU" from "event_location_id"
		And I check "event_gospel_shared"
		And I fill in "event_meals_served" with "100" 
		And I fill in "event_bibles_distributed" with "100" 
		And I click the button "Create Event"
		Then I should see "Event was sucessfully created"

 	Scenario: Adding a new event that works from event index page
	  	Given I go to "the event index page"
	  	And I click the button "Add event"
	  	Then I select "Choir" from "event_program_id"
		And I select "CMU" from "event_location_id"
		And I check "event_gospel_shared"
		And I fill in "event_meals_served" with "100" 
		And I fill in "event_bibles_distributed" with "100" 
		And I click the button "Create Event"
		Then I should see "Event was sucessfully created"

	Scenario: Program field is missing
	 	Given I go to "the new event page"
		Then I select "CMU" from "event_location_id"
		And I check "event_gospel_shared"
		And I fill in "event_meals_served" with "100" 
		And I fill in "event_bibles_distributed" with "100" 
		And I click the button "Create Event"
		Then I should see "must enter program"

	Scenario: Location field is missing
	  	Given I go to "the new event page"
	   	Then I select "Choir" from "event_program_id"
		And I check "event_gospel_shared"
		And I fill in "event_meals_served" with "100" 
		And I fill in "event_bibles_distributed" with "100" 
		And I click the button "Create Event"
		Then I should see "must enter location"

  	Scenario: Meals served is negative
  		Given I go to "the new event page"
	   	Then I select "Choir" from "event_program_id"
		And I select "CMU" from "event_location_id"
		And I check "event_gospel_shared"
		And I fill in "event_meals_served" with "-20" 
		And I fill in "event_bibles_distributed" with "100" 
		And I click the button "Create Event"
		Then I should see "is not a valid number" #next to "Meals served" field

	Scenario: Bibles distributed is not integer
  		Given I go to "the new event page"
	   	Then I select "Choir" from "event_program_id"
		And I select "CMU" from "event_location_id"
		And I check "event_gospel_shared"
		And I fill in "event_meals_served" with "100" 
		And I fill in "event_bibles_distributed" with "bad" 
		And I click the button "Create Event"
		Then I should see "is not a valid number" #next to "Bibles destributed" field

	Scenario: End time must be after the start time
		Given I go to "the new event page"
	   	Then I select "Choir" from "event_program_id"
	   	And I select "11 AM" from "event_start_time_4i"
	   	And I select "00" from "event_start_time_5i"
	   	And I select "08 AM" from "event_end_time_4i"
	   	And I select "00" from "event_end_time_5i"
		And I select "CMU" from "event_location_id"
		And I check "event_gospel_shared"
		And I fill in "event_meals_served" with "100" 
		And I fill in "event_bibles_distributed" with "bad" 
		And I click the button "Create Event"
		Then I should see "must be after the start of the event"
	