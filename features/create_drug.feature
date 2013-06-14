Feature: Creating a new drug

Background:
	Given I am logged in as administrator
	Given an initial setup
	When I go to the new drug page
		
	Scenario: Adding a new drug works
	    When I fill in "Name" with "Pepto Bismol"
        And I fill in "Description" with "Used for upset stomachs and diahrrea"
        And I check "drug_active"
        And I check "drug_otc"
        And I click the button "Create Drug"
        Then I should see "Drug was successfully created"
        Then I should see "Add a Note"

    Scenario: Name field is missing
        When I fill in "Name" with ""
        And I fill in "Description" with "Used for common allergies as an inhaler"
        And I check "drug_active"
        And I check "drug_otc"
        And I click the button "Create Drug"
        Then I should see "can't be blank"
   
   Scenario: Name has the same name of an existing drug
        Given some drugs
        When I fill in "Name" with "Motrin"
        When I fill in "Description" with "Used for minor headaches"
        And I check "drug_active"
        And I check "drug_otc"
        And I click the button "Create Drug" 
        # name is already in use is for program - should we keep it consistent?
        Then I should see "has already been taken" 
   
   Scenario: Cancel creating a program
        When I fill in "Name" with "Pepto Bismol"
        And I check "drug_active"
        And I check "drug_otc"
        When I click on the link "Cancel"
        And I should be on "the drug index page"
        Then I should see "Drug Listing"



