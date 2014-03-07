require 'spec_helper'

describe "Navigating Rooms" do
	
	it "allows navigation from the list page to the detail page" do
		room = Room.create(room_attributes)
		visit rooms_url

		click_link room.name

		expect(current_path).to eq(room_path(room))
	end

	it "allows navigation from the detail page to the list page" do
		room = Room.create(room_attributes)
		visit room_url(room)

		click_link "All Rooms"

		expect(current_path).to eq(rooms_path)
		expect(page).to have_text("Rooms")
	end

	it "allows navigation from the detail page to the edit page" do
		room = Room.create(room_attributes)
		visit room_url(room)

		click_link "Edit"

		expect(current_path).to eq(edit_room_path(room))
		expect(page).to have_selector('form')
	end
	
	it "allows navigation from the edit page to the detail page" do
		room = Room.create(room_attributes)
		visit edit_room_url(room)

		click_link "Cancel"

		expect(current_path).to eq(rooms_path)
		expect(page).to have_text(room.name)
	end

end