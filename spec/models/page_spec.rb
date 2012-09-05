require 'spec_helper'

describe Page do

  it 'raises error when saves withot title' do 
  	page = FactoryGirl.create(:page)
  	page.title = nil
  	page.save.should raise_error
  end

  it 'should save model without published_on attribute' do 
  	page = FactoryGirl.create(:page)
  	page.published_on = nil
  	page.save.should raise_error
  end



end
