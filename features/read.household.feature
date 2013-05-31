Feature: Reading a household

As an administrator, I want to see view a page of an existing household in order to view details of the household.

Background:
  Given I am logged in as administrator
  Given an initial setup
  Given some households

    Scenario: See an exisiting household page
		When I go to the "Smith" page
	    Then I should see "Smith Household"
	    And I should see "Smith Children"
	    And I should see "Smith Guardians"
	    And I should see "15213"
