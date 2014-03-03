require 'spec_helper'

describe "A Campus" do
	it "has many events" do
		campus = Campus.new(campus_attributes)

		event1 = campus.events.new(event_attributes)
		event2 = campus.events.new(event_attributes)

		expect(campus.events).to include(event1)
		expect(campus.events).to include(event2)
	end

	it "deletes associated events" do
		campus = Campus.create(campus_attributes)

	  	campus.events.create(event_attributes)

	  	expect { 
	    	campus.destroy
	  	}.to change(Event, :count).by(-1)
	end

	it "requires a valid name" do
		campus = Campus.new(campus_attributes)
		campus2 = Campus.new(campus_attributes(name: ""))
		campus3 = Campus.new(campus_attributes(name: "1"))

		expect(campus.valid?).to be_true
		expect(campus2.valid?).to be_false
		expect(campus3.valid?).to be_false
	end

	it "requires a unique name" do
		campus = Campus.create(campus_attributes)
		campus2 = Campus.new(campus_attributes)

		expect(campus2.valid?).to be_false
	end

	it "requires a valid address" do
		campus_all_valid = Campus.new(campus_attributes)
		
		campus_no_address1 = Campus.new(campus_attributes(address1: "")) #test presence
		campus_invalid_address1 = Campus.new(campus_attributes(address1: "123")) #test validity
		
		campus_no_city = Campus.new(campus_attributes(city: "")) #test presence
		campus_invalid_city = Campus.new(campus_attributes(city: "")) #test alpha characters only

		campus_no_state = Campus.new(campus_attributes(state: "")) #test presence
		campus_invalid_state_length = Campus.new(campus_attributes(state: "MASSACHUSETTS")) #test length

		campus_no_postal_code = Campus.new(campus_attributes(postal_code: "")) #test presence
		campus_invalid_postal_code = Campus.new(campus_attributes(postal_code: "asdf")) #test for numeric values only

		campus_no_country = Campus.new(campus_attributes(country: "")) #test presence
		# campus_invalid_country = Campus.new(campus_attributes(country: "XX")) #test values from country list		

		expect(campus_all_valid.valid?).to be_true
		expect(campus_no_address1.valid?).to be_false
		expect(campus_invalid_address1.valid?).to be_false
		expect(campus_no_city.valid?).to be_false
		expect(campus_invalid_city.valid?).to be_false
		expect(campus_invalid_state_length.valid?).to be_false
		expect(campus_no_postal_code.valid?).to be_false
		expect(campus_invalid_postal_code.valid?).to be_false
		expect(campus_no_country.valid?).to be_false
		# expect(campus_invalid_country.valid?).to be_false
	end

	it "properly returns a formatted address" do
		campus = Campus.new(campus_attributes)

		expect(campus.address).to eq("68 Princeton Street\n\nNorth Chelmsford, MA, 01863")
	end

end