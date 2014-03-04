require 'spec_helper'

describe "Creating an Event" do

	it "saves the Event after all required fields are valid" do
		service = Service.create(service_attributes)
		campus = Campus.create(campus_attributes)

		visit new_event_path

		fill_in "Name", with: "Weekend Worship Gathering"
		fill_in "Attendance", with: 321
		select "2014", from: "event[date(1i)]"
		select "February", from: "event[date(2i)]"
		select "1", from: "event[date(3i)]"
		select "07 PM", from: "event[time(4i)]"
		select "15", from: "event[time(5i)]"
		select(service.name, from: "event_service_id")
		select(campus.name, from: "event_campus_id")

		click_button "Create Event"

		expect(page).to have_text("Weekend Worship Gathering")
		expect(page).to have_text("Weekend Worship Gathering was successfully created!")
	end

	it "does not save the Event if required fields are empty" do
		visit new_event_path

		#Don't fill-in any fields

		click_button "Create Event"

		expect(page).to have_text("Oops! The event could not be saved.")
		expect(page).to have_text("Please correct the following 3 errors")
	end

	it "does not save the Event if required fields are invalid" do
		visit new_event_path

		fill_in "Name", with: "1" #too short
		#leave date and time blank

		click_button "Create Event"

		expect(page).to have_text("Oops! The event could not be saved.")
		expect(page).to have_text("Please correct the following 3 errors")
	end

end