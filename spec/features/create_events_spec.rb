require 'spec_helper'

describe "Creating an Event" do

	it "saves the Event after all required fields are valid" do
		service = Service.create(service_attributes)
		campus = Campus.create(campus_attributes)

		visit new_event_path

		fill_in "Name", with: "Weekend Worship Gathering"
		fill_in "Attendance", with: 321
		fill_in "Date", with: "01/01/2013"
		fill_in "Time", with: "17:00"
		select(service.name, from: "event_service_id")
		select(campus.name, from: "event_campus_id")

		click_button "Create Event"

		expect(page).to have_text("Weekend Worship Gathering")
		expect(page).to have_text("Weekend Worship Gathering was successfully created!")
	end

	it "does not save the Event if required fields are empty" do
		visit new_event_path

		#Don't fill-in any fields
		#Attendance has a default field value of 0

		click_button "Create Event"

		expect(page).to have_text("Oops! The event could not be saved.")
		expect(page).to have_text("Please correct the following 5 errors")
	end

	it "does not save the Event if required fields are invalid" do
		visit new_event_path

		fill_in "Name", with: "1" #too short
		fill_in "Attendance", with: 0
		#leave date and time blank

		click_button "Create Event"

		expect(page).to have_text("Oops! The event could not be saved.")
		expect(page).to have_text("Please correct the following 5 errors")
	end

	#TODO: Enable headless browser testing for Travis so this can run
	# it "allows the creation of a campus/room from within the event form", js: true do
	# 	visit new_event_path

	# 	select "Create New...", from: "event_campus_id"

	# 	expect(page).to have_text("Add a Campus")

	# end

end