When /^i trying to send bulshit to update path$/ do
  page.driver.put( '/api/pages/1', "Bull shit")
end

When /^i trying to update page and send empty title$/ do
  params = {:pages=>[{:title=>nil, :content=>'sample content', :published_on => Time.now}]}
  page.driver.put('/api/pages/1', params)
end

When /^i updating model with right values$/ do
  params = {:pages=>[{:title=>'asd', :content=>'sample content', :published_on => Time.now}]}
  page.driver.put('/api/pages/1', params)
end

Then /^page should be saved$/ do
  decode_response('json')['success'].should be_true
	decode_response('json')['message'].should be_empty
	decode_response('json')['pages'].should_not be_empty
end
