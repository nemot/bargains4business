class Page < ActiveRecord::Base
	
	validates_presence_of :title, :content
	validates_uniqueness_of :title
	
	def publish!
		update_attributes(:published_on=>Time.now)
	end
	
end
