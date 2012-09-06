Given /^system has (\d+) pages$/ do |pages_num|	
	pages_num.to_i.times{ FactoryGirl.create(:page)}
end

When /i visiting (.*)/ do |path|
	visit path.gsub("'",'')
end

Then /^i should see pages list in (xml|json) format with (\d+) records inside$/ do |format, records_number|
	decode_response(format)['pages'].length.should eql(records_number.to_i)
	header 'Content-Type', 'application/xml'
end

Then /^(xml|json) response should have key "(.*?)"$/ do |format, key|
	decode_response(format).should have_key(key)
end

Then /^first page in (xml|json) response should have following fields:$/ do |format, table|
	decode_response(format)['pages'].first.should have_keys(table.hashes.map{|h| h["field"]})
end

Given /^system has (\d+) (published|unpublished) pages$/ do |pages_num, published|
  pages_num.to_i.times{|i| FactoryGirl.create(:page, :published_on=>(published.eql?('published') ? (Time.now-i.days) : nil))}
end
