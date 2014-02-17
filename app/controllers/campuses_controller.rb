class CampusesController < ApplicationController

	def index
		@campuses = Campus.all
	end

end