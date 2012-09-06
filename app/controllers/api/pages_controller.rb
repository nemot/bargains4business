class Api::PagesController < ApplicationController

	def index
		pages = Page.all
		make_respond true, [], pages
	end

	def show
		page = Page.find(params[:id])
		make_respond !page.nil?, (page.nil? ? ['Page not found'] : []), page
	end

	def update
		logger.info "*"*100
		begin
			page = Page.find(params[:id])

			logger.info "*"*100
			logger.info(page.inspect)
			logger.info(params['pages'].first)
			logger.info "*"*100
			
			page.update_attributes(params['pages'].first)
			make_respond page.errors.empty?, page.errors.messages, page
		rescue Exception => e
			logger.info "*"*100
			logger.info(e.inspect)
			logger.info "*"*100
			make_respond false, 'Do not post bullshit!', []
		end
	end

	def create
		begin		
			page = Page.create(params['pages'].first)
			make_respond page.errors.empty?, page.errors.messages, page
		rescue
			make_respond false, 'Do not post bullshit!', []
		end
	end

	def destroy
		page = Page.find(params[:id])
		page.destroy
		make_respond page.destroyed?, page.errors.messages, page
	end


	def published
		pages = Page.where('published_on IS NOT NULL').order('published_on DESC')
		make_respond true, [], pages
	end

	def unpublished
		pages = Page.where(:published_on=>nil)
		make_respond true, [], pages
	end	

	def publish
		page = Page.find(params[:id])
		page.publish!
		make_respond page.errors.empty?, page.errors.messages, page
	end

	def total_words
		page = Page.find(params[:id])
		make_respond !page.nil?, (page.nil? ? ['Page not found'] : []), page, (page.nil? ? 0 : page.content.scan(/[\w-]+/).size)
	end

	private
	# Generates respond. Created for DRY conception
	def make_respond success, messages, pages, words_count=nil
		pages = [pages] if pages.is_a?(Page)
		result = {:success => success, :message=>messages, :pages=>pages}
		result.merge!(:total_words=>words_count) if words_count
		respond_to do |format|
			format.html {render :json=>result}
			format.json {render :json=>result}
			format.xml {render :xml=>result}
		end
	end

end
