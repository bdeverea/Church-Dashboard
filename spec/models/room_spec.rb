require 'spec_helper'

describe "A Room" do
	it "belongs to a Campus" do
		campus = Campus.create(campus_attributes)
		room = campus.rooms.new(room_attributes(campus_id: ''))

		expect(room.campus).to eq(campus)

	end
	it "requires a unique name  of >4 chars per campus" do
		room = Room.create(room_attributes)
		room2 = Room.new(room_attributes(campus_id: 999))
		room3 = Room.new(room_attributes) #same campus and name as room
		room4 = Room.new(room_attributes(name:'123'))

		expect(room2.valid?).to be_true
		expect(room3.valid?).to be_false
		expect(room4.valid?).to be_false
	end
	
	it "requires a campus_id" do
		room = Room.new(room_attributes(campus_id: ''))

		expect(room.valid?).to be_false
	end
end
