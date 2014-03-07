require 'spec_helper'

describe "Deleting a Room" do
	
	it "removes the Room from the database" do
		room = Room.create(room_attributes)

		visit room_path(room)

		click_link 'Delete'

		expect(current_path).to eq(rooms_path)
		expect(page).to have_text("#{room.name} has been successfully deleted!")
	end

end