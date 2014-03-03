require 'spec_helper'

describe "Deleting an Event" do
	
	it "removes the Event from the database" do
		event = Event.create(event_attributes)

		visit event_path(event)

		click_link 'Delete'

		expect(current_path).to eq(events_path)
		expect(page).to have_text("#{event.name} has been successfully deleted!")
	end

end