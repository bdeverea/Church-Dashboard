class PeopleController < ApplicationController

	def index
		@people = ['Doe, John', 'Doe, Jane', 'Horse, Ed'].sort
	end

end