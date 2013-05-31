Feature: Updating a household

As an administrator, I want to edit an existing household in order to make changes on the household.

Background:
  Given I am logged in as administrator
  Given an initial setup
  Given some households

    Scenario: Edit insurance company of a household
		When I go to "the edit Smith page"
	    And I fill in "Insurance company" with "Blue Shield"
	    And I click the button "Update Household"
	    Then I should see "Household was successfully updated"
	    Then I should see "Company: Blue Shield"
	    
	#click the button "Edit" from household index

	#click the button "Edit this household" from household page
