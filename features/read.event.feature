Feature: Reading an event

As an administrator, I want to view a page of an existing event in order to view details of the event.

Background:
  Given I am logged in as administrator
  Given an initial setup
  Given some programs and events

    Scenario: See an exisiting event page
		When I go to "the Monday class page"
	    Then I should see "Choir"
	    And I should see "CMU"

