Feature: Updating an existing drug

Background:
	Given I am logged in as administrator
	Given an initial setup
    Given some drugs

		
	Scenario: Edit an existing drug by selecting a drug
      # When I am on "the Motrin page"
      # And I should see "Add a Note"
      # Then I click on the button "Edit this drug"
        When I am on "the edit Motrin page"
        And I fill in "drug_description" with "Used primarily for headaches and nausea" 
        When I click the button "Update Drug"
        Then I should see "Drug was successfully updated."
        And I am on "the edit Motrin page"


    Scenario: Edit an existing drug through the Dashboard
      # When I am on the "Dashboard" page
      # And I should see "Drug Listing"
      # When I click on the button "Edit" next to "Motrin"
        When I am on "the edit Motrin page"
        And I fill in "drug_description" with "Used primarily for headaches and nausea" 
        When I click the button "Update Drug"
        Then I should see "Drug was successfully updated."
        And I am on "the edit Motrin page"

    Scenario: Cancel editing a drug
      # When I am on "the Motrin page"
      # And I should see "Add a Note"
      # Then I click on the button "Edit this drug"
       When I am on "the edit Motrin page"
       And I fill in "drug_description" with "Used primarily for headaches and nausea" 
       When I click on the link "Cancel"
       Then I am on "the edit Motrin page"
