class Api::PagesController < ApplicationController

	def index
		@pages = Page.all
		respond_to do |format|
			format.html {render :json=>@pages}
			format.xml {render :xml=>@pages}
		end
	end

	def update
		@page = Page.update(params[:id], params[:page])
		make_respond @page.errors.empty?, @page.errors.messages
	end

	def create
		@page = Page.create(params[:page])
		make_respond @page.errors.empty?, @page.errors.messages
	end

	def destroy
		@page = Page.find(params[:id])
		@page.destroy
		make_respond @page.destroyed?, @page.errors.messages
	end

	def total_words
		@words_count = Page.where(id: params[:id]).scan(/[\w-]+/).size
	end

	private
	# Generates respond. Created for DRY conception
	def make_respond success, errors
		result = {:success => success, :message=>messages}
		respond_to do |format|
			format.html {render :json=>result}
			format.xml {render :xml=>result}
		end
	end

end
