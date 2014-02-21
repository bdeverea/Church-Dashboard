require 'spec_helper'

describe "An Event" do
	
	it "requires a unique name and datetime combination" do
		event = Event.create(event_attributes)
		event2 = Event.create(event_attributes)

		expect(event.valid?).to be_true
		expect(event2.valid?).to be_false
	end

	it "does not require a unique name" do
		event = Event.create(event_attributes)
		event2 = Event.create(event_attributes(date_time: Time.now))

		expect(event.valid?).to be_true
		expect(event2.valid?).to be_true
	end

	it "requires a service_id" do
		event = Event.new(event_attributes(service_id: 1))
		event_no_service_id = Event.new(event_attributes(service_id: ''))

		expect(event.valid?).to be_true
		expect(event_no_service_id.valid?).to be_false
	end

	it "requires a campus_id" do
		event = Event.new(event_attributes(campus_id: 2))
		event_no_campus_id = Event.new(event_attributes(campus_id: ''))

		expect(event.valid?).to be_true
		expect(event_no_campus_id.valid?).to be_false
	end
	
end