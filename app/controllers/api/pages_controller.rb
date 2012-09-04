class Api::PagesController < ApplicationController

	def index
		@pages = Page.all
		# respond_to do |format|
		# 	format.html {render :json=>@pages.as_json}
		# 	format.xml {render :xml=>@pages.to_xml}
		# end
	end

	def new
		
	end

	def update
	end

	def create
	end

	def edit
	end

	def destroy
	end


end
