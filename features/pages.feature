Feature: Show pages
	In order to user api
	As a simple user without authentication
	I want to have access to api

	Scenario: Check structure of page
		Given system has 1 pages

		When i visiting '/api/pages'
		Then json response should have key "pages"
		And first page in json response should have following fields:
			|field 				|
			|content			|
			|created_at		|
			|id 					|
			|published_on	|
			|title				|
			|updated_at		|
		When i visiting '/api/pages.xml'
		Then xml response should have key "pages"
		And first page in xml response should have following fields:
			|field 				|
			|content			|
			|created_at		|
			|id 					|
			|published_on	|
			|title				|
			|updated_at		|


	Scenario: Show empty list
		Given system has 0 pages

		When i visiting '/api/pages'
		Then i should see pages list in json format with 0 records inside

		When i visiting '/api/pages.json'
		Then i should see pages list in json format with 0 records inside

		When i visiting '/api/pages.xml'
		Then i should see pages list in xml format with 0 records inside

	Scenario: Show list
		Given system has 10 pages

		When i visiting '/api/pages'
		Then i should see pages list in json format with 10 records inside

		When i visiting '/api/pages.json'
		Then i should see pages list in json format with 10 records inside

		When i visiting '/api/pages.xml'
		Then i should see pages list in xml format with 10 records inside

	Scenario: Published list
		Given system has 2 published pages
		And system has 5 unpublished pages
		When i visiting '/api/pages/published'
		Then i should see pages list in json format with 2 records inside

	Scenario: Unpublished list
		Given system has 5 published pages
		And system has 2 unpublished pages
		When i visiting '/api/pages/unpublished'
		Then i should see pages list in json format with 2 records inside

	Scenario: Words count
		Given system has 1 pages
		When i visiting '/api/pages/1/total_words'
		Then i should see pages list in json format with 1 records inside
		And json response should have key "total_words"