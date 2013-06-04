Feature: Updating an event

As an administrator, I want to edit an existing event in order to make changes on the household.

Background:
  Given I am logged in as administrator
  Given an initial setup
  Given some programs and events

    Scenario: Edit number of meals served
		When I go to "the edit Monday class page"
	    And I fill in "event_meals_served" with "20"
	    And I click the button "Update Event"
	    Then I should see "Choir Event was successfully updated"
	    
	#click the button "Edit" from event index

	#click the button "Edit this event" from event page
