Feature: Creating a new household

As an administrator, I want to create a new household in order to associate students to a proper household.

Background:
  Given I am logged in as administrator
  Given an initial setup

	Scenario: Adding a new household that works from dashboard
		Given I go to "the Dashboard"
		And I click the button "Add Household"
		And I fill in "Name" with "Turner"
		And I fill in "Street" with "1212 Here Street"
		And I fill in "City" with "Pittsburgh"
		And I fill in "Zip" with "15271"
		And I check "Active"
		And I click the button "Create Household" 
		Then I should see "Household was sucessfully created"

 	Scenario: Adding a new household that works from household index page
	  	Given I go to "the household index page"
	  	And I click the button "Add Household"
	  	And I fill in "Name" with "Turner"
	    And I fill in "Street" with "1212 Here Street"
	    And I fill in "City" with "Pittsburgh"
	    And I fill in "Zip" with "15271"
	    And I check "Active"
	    And I click the button "Create Household" 
	    Then I should see "Household was sucessfully created"

	Scenario: Name field is missing
	 	Given I go to "the new household page"
	    When I fill in "Name" with ""
	    And I fill in "Street" with "1212 Here Street"
	    And I fill in "City" with "Pittsburgh"
	    And I fill in "Zip" with "15271"
	    And I check "Active"
	    And I click the button "Create Household" 
	    Then I should see "can't be blank" #next to the "Name" field

	Scenario: Street field is missing
	  	Given I go to "the new household page"
	    When I fill in "Name" with "Turner"
	    And I fill in "Street" with ""
	    And I fill in "City" with "Pittsburgh"
	    And I fill in "Zip" with "15271"
	    And I check "Active"
	    And I click the button "Create Household" 
	    Then I should see "can't be blank" #next to the "Street" field

	Scenario: City field is missing
	  	Given I go to "the new household page"
	    When I fill in "Name" with "Turner"
	    And I fill in "Street" with "1212 Here Street"
	    And I fill in "City" with ""
	    And I fill in "Zip" with "15271"
	    And I check "Active"
	    And I click the button "Create Household" 
	    Then I should see "can't be blank" #next to the "City" field

	Scenario: Zip code field is missing
	    Given I go to "the new household page"
	    When I fill in "Name" with "Turner"
	    And I fill in "Street" with "1212 Here Street"
	    And I fill in "City" with "Pittsburgh"
	    And I fill in "Zip" with ""
	    And I check "Active"
	    And I click the button "Create Household" 
		Then I should see "should be five digits long" #next to the "Zip Code" field 

  	Scenario: Zip code number is too short
  		Given I go to "the new household page"
	    When I fill in "Name" with "Turner"
	    And I fill in "Street" with "1212 Here Street"
	    And I fill in "City" with "Pittsburgh"
	    And I fill in "Zip" with "1527"
	    And I check "Active"
	    And I click the button "Create Household" 
	    Then I should see "should be five digits long" #next to the "Zip Code" field 
