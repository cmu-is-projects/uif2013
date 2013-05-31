Feature: Creating a new student drug assignment

As an administrator, I want to add drug assignment to a student in order to note parental permission on maximum dosage of each drug.

Background:
	Given I am logged in as administrator
	Given an initial setup
	When I go to the student page
	#And I have clicked on the student
	#And I have clicked on Add Drug Assignment

	Scenario: Drug is missing
		 When I fill in "Name" with "Stephany Park"
		 And I select "" from "student_drug_id"
		 And I fill in "Dosage" with "2"
		 And I click the "Create" button
		 Then I should see "drug is required"

	Scenario: Dosage is invalid
		 When I fill in "Name" with "Stephany Park"
		 And I select "Tylenol" from "student_drug_id"
		 And I fill in "Dosage" with "bad"
		 And I click the "Create" button
		 Then I should see "is not a valid number" next to the "Dosage" field