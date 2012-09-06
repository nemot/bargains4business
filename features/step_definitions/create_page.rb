When /^i trying to send bulshit to create path$/ do
	page.driver.post( '/api/pages', "Bull shit")
end

Then /^page should not be saved$/ do
	decode_response('json')['success'].should be_false
end

Then /^i should see error message$/ do
	decode_response('json')['message'].should_not be_empty
end

When /^i creating model without title$/ do
	params = {:pages=>[{:title=>nil, :content=>'sample content', :published_on => Time.now}]}
  page.driver.post('/api/pages', params)
end

When /^i creating model with right values$/ do
	params = {:pages=>[{:title=>'Some title', :content=>'sample content', :published_on => Time.now}]}
	page.driver.post('/api/pages', params)
end

Then /^page should be created$/ do
	decode_response('json')['success'].should be_true
	decode_response('json')['message'].should be_empty
	decode_response('json')['pages'].should_not be_empty
end
