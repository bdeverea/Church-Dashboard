require 'spec_helper'

describe "Viewing the list of people" do
	it "lists the people" do
		visit 'http://example.com/people'

		expect(page).to have_text('3 People')
	end
	
	it "lists the people alphabetically by last name" do
		visit 'http://example.com/people'

		page.should have_selector("ol li:nth-child(1)", text: 'Doe, Jane')
		page.should have_selector("ol li:nth-child(2)", text: 'Doe, John')
		page.should have_selector("ol li:nth-child(3)", text: 'Horse, Ed')
	end

end