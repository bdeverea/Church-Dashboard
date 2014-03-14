require 'spec_helper'

describe "Creating a Room" do
	
	it "saves the room when all required fields are valid" do
		campus = Campus.create(campus_attributes)
		
		visit new_room_url

		fill_in "Name", with: "Green Room"
		fill_in "Description", with: "HoH Kids Harbor - Nursery"
		fill_in "Capacity", with: 15
		select campus.name, from: "room_campus_id"

		click_button "Create Room"
		expect(page).to have_text("Green Room has been successfully created!")
	end

	it "does not save the room when required fields are invalid" do

		visit new_room_url

		fill_in "Name", with: ""
		fill_in "Description", with: "HoH Kids Harbor - Nursery"
		fill_in "Capacity", with: -1

		click_button "Create Room"

		expect(page).to have_text("Oops! The room could not be saved. Please correct the following 2 errors")
	end

	it "does not save the room when the required fields are empty" do
		visit new_room_url

		fill_in "Name", with: ""
		fill_in "Capacity", with: 0

		click_button "Create Room"

		expect(page).to have_text("Oops! The room could not be saved. Please correct the following 1 error")
	end

end