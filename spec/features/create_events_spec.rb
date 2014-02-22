require 'spec_helper'

describe "Creating an Event" do
	
	it "saves the Event after all required fields are valid" do
		visit new_event_path

		fill_in "Name", with: "Weekend Worship Gathering"
		fill_in "Date", with: "2014-01-04"
		fill_in "Time", with: "17:00"
		click "Create Event"

		expect(page).to have_text("Weekend Worship Gathering")
	end

	it "does not save the Event if required fields are empty"
	it "does not save the Event if required fields are invalid"

end