Feature: Creating a new household

As an administrator, I want to create a new household in order to associate students to a proper household.

Background:
  Given I am logged in as administrator
  Given an initial setup
  When I go to the households page
  
  Scenario: See the list of households
	#When I fill in "Name" with "Chess"
    # Then show me the page
    Then I should see ""
