require 'spec_helper'

describe "Navigating Events" do

	it "allows navigation from the list page to the detail page" do
		event = Event.create(event_attributes)

		visit events_url

		click_link event.name

		expect(page).to have_text(event.time)
		expect(page).to have_text(event.date)
		expect(page).to have_selector('p')

	end

	it "allows navigation from the list page to the create page" do
		visit events_url

		click_link 'Create Event'

		expect(current_path).to eq(new_event_path)
		expect(page).to have_selector('form')
		expect(page).to have_text('Create an Event')

	end

	it "allows navigation from the create page to the list page" do
		visit new_event_path

		click_link 'Cancel'

		expect(current_path).to eq(events_path)
		expect(page).to have_text("Events")
		expect(page).to have_selector('ul')
	end
	
	it "allows navigation from the detail page to the list page" do
		event = Event.create(event_attributes)
		visit event_path(event)

		click_link('All Events')

		expect(page).to have_text("Events")
		expect(page).to have_selector('ul li')

	end

	it "allows navigation from the detail page to the edit page" do 
		event = Event.create(event_attributes)

		visit event_path(event)

		click_link('Edit')

		expect(page).to have_text("Edit #{event.name}")
		expect(page).to have_selector('form')
	end
	
	it "allows navigation from the edit page to the list page" do
		event = Event.create(event_attributes)

		visit edit_event_path(event)

		click_link('Cancel')

		expect(page).to have_text("Events")
		expect(page).to have_selector('ul li')
	end

	it "redirects to the list page after deleting an event" do
		event = Event.create(event_attributes)

		visit event_path(event)

		click_link('Delete')

		expect(current_path).to eq(events_path)
	end

	it "redirects to the create campus form if js is disabled and 'Create New...' is selected" do
		visit new_event_path

		select "Create New...", from: 'event_campus_id'
		click_button('Create Event')

		expect(current_path).to eq(new_campus_path)

	end

end