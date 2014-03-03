require 'spec_helper.rb'

describe "Viewing a list of Campuses"  do
	it "lists campuses in alphabetical order" do
		campus1 = Campus.create(campus_attributes)
		campus2 = Campus.create(campus_attributes(name: "Tynsgborough Campus"))
		campus3 = Campus.create(campus_attributes(name: "Lowell Main Campus"))

		visit "http://example.com/campuses"

		expect(page).to have_text('3 Campuses')
		page.should have_selector("ol li:nth-child(1)", text: campus1.name)
		page.should have_selector("ol li:nth-child(2)", text: campus3.name)
		page.should have_selector("ol li:nth-child(3)", text: campus2.name)
	end
end