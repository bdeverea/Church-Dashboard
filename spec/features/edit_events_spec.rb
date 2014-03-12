require 'spec_helper'

describe "Editing an Event" do
	
	it "saves the updates when required fields are valid" do
		event = Event.create(event_attributes)
		campus = Campus.create(campus_attributes)
		service = Service.create(service_attributes)

		visit edit_event_path(event)

		expect(find_field('Name').value).to eq(event.name)

		fill_in 'Name', with: "Updated Event Name"
		fill_in 'Attendance', with: 222
		select(service.name, from: "event_service_id")
		select(campus.name, from: "event_campus_id")
    	click_button 'Update Event'

    	expect(current_path).to eq(event_path(event))
	    expect(page).to have_text('Updated Event Name')
	    expect(page).to have_text(' successfully updated!')
	end

	it "does not save the updates when the required fields are invalid" do
		event = Event.create(event_attributes)

		visit edit_event_path(event)

		expect(find_field('Name').value).to eq(event.name)

		fill_in 'Name', with: ""
    	click_button 'Update Event'

	    expect(page).to have_text('Oops! The event could not be saved.')
	    expect(page).to have_text('Please correct the following 4 errors')
	end

end