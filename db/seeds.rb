# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

#Clear country table and reload with 
Country.delete_all


#Lookup country list from gist and load it into db table
country_list_uri = "https://gist.githubusercontent.com/marijn/396531/raw/c0e2ee6cfbc53b4801a5193b6c22e44182266279/countries.txt"

open(country_list_uri) do | countries |
	countries.each do | country |
		code, name = country.chomp.split("|")
		Country.create!(name: name, code: code)
	end
end