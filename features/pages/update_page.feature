Feature: Update page

	Scenario: Error after invalid request
		When i trying to send bulshit to update path
		Then page should not be saved
		And i should see error message

	Scenario: Raise error if not have title
		Given system has 1 pages
		When i trying to update page and send empty title
		Then page should not be saved
		And i should see error message

	Scenario: Save properly
		Given system has 1 pages
		When i updating model with right values
		Then page should be saved