require 'spec_helper'

describe "An Event" do
	
	it "belongs to a Service" do
		service = Service.create(service_attributes)
		event = service.events.new(event_attributes)

		expect(event.service).to eq(service)

	end

	it "belongs to a Campus" do
		campus = Campus.create(campus_attributes)
		event = campus.events.new(event_attributes)

		expect(event.campus).to eq(campus) 
	end

	it "has one room" do
		room = Room.create(room_attributes)
		event = Event.create(event_attributes(room_id: room.id))

		expect(event.room).to eq(room)
	end

	it "requires a unique name and datetime combination" do
		event = Event.create(event_attributes)
		event2 = Event.new(event_attributes)

		expect(event.valid?).to be_true
		expect(event2.valid?).to be_false
	end

	it "does not require a unique name" do
		event = Event.create(event_attributes)
		event2 = Event.create(event_attributes(date: Date.today.to_s))

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

	it "accepts attendance value greater than 0" do
		event = Event.new(event_attributes)
		event2 = Event.new(event_attributes(attendance: -10))

		expect(event.valid?).to be_true
		expect(event2.valid?).to be_false
	end
	
end