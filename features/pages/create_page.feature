Feature: Create page
	In order to create page
	I should have this ability

	Scenario: Error after invalid request
		When i trying to send bulshit to create path
		Then page should not be saved
		And i should see error message

	Scenario: Raise error if not have title
		When i creating model without title
		Then page should not be saved
		And i should see error message

	Scenario: Save properly
		When i creating model with right values
		Then page should be created