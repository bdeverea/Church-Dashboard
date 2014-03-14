require 'spec_helper'

describe "Editing a Room" do

	it "updates the room when required fields are valid" do
		room = Room.create(room_attributes)
		campus = Campus.create(campus_attributes)

		visit edit_room_url(room)

		fill_in "Name", with: "Updated Room Name"
		fill_in "Description", with: "This is an updated room used for Kids Harbor"
		fill_in "Capacity", with: 999
		select campus.name, from: "room_campus_id"

		click_button ("Update Room")

		expect(page).to have_text("Updated Room Name has been successfully updated!")
	end

	it "does not update the room when required fields are invalid" do
		room = Room.create(room_attributes)
		campus = Campus.create(campus_attributes)

		visit edit_room_url(room)

		fill_in "Name", with: ""
		select "", from: "room_campus_id"

		click_button ("Update Room")

		expect(page).to have_text("Oops! The room could not be saved. Please correct the following 1 error")
	end

end