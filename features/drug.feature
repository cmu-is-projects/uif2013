Feature: Creating a new drug

Background:
	Given I am logged in as administrator
	When I visit the page Dashboard
	And I have clicked on the button Add Drug
	And I am able to enter my drug details

		
	Scenario: Name field is missing
	    When I fill in "Name" with ""
		And I fill in "Description" with "Used for headaches" 
		And I click the checkbox "Is active"
		And I click the checkbox "Is Over-the-Counter" 
		When I click the button "Create Drug"
		Then I should see "can't be blank" next to the "Name" field

	Scenario: Description field is missing
	    When I fill in "Name" with "Ibuprofen"
	   	And I fill in "Description" with "" 
		And I click the checkbox "Is active"
		And I click the checkbox "Is Over-the-Counter"
		When I click the button "Create Drug" 
		Then I should see the "Ibuprofen" details page
		And "N/A" under the "Description"

	Scenario: An inactive drug is being used
		When I fill in "Name" with "Ibuprofen"
	   	And I fill in "Description" with "Used for headaches" 
		And I do not click the checkbox "Is active"
		And I click the checkbox "Is Over-the-Counter"
		When I click the button "Create Drug" 
		Then I should see a list of active drugs without "Ibuprofen"

	Scenario: Delete a drug
		When I am on on the drugs page
		Then I should see a list of active drugs
		When I click on the drug link 'Motrin'
		Then I should see a button "Destroy this drug"
		When I click the button "Destroy this drug"
		Then I should see a javascript message "Are you sure?"
		And I click "OK"
		Then I should see a list of locations without "Motrin"

	Scenario: Edit existing drug
		When I am on the "Motrin" drug page
		And I want to edit a detail
		Then I click on the button "Edit this drug"
		And after making the change I click the button "Update this drug"
		Then I should the "Motrin" drug page with the updated changes

	Scenario: Return to drug page
		When I am on the "Motrin" drug page
		Then I should see a button "Back to drugs"
		When I click the button "Back to drugs"
		Then I should see a list of drugs

