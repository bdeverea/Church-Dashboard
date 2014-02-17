require 'spec_helper'

describe "A Campus" do
	it "requires a name" do
		campus = Campus.new(campus_attributes)
		campus2 = Campus.new(campus_attributes(name: ""))

		expect(campus.valid?).to be_true
		expect(campus2.valid?).to be_false

	end

	it "requires an address1" do
		campus = Campus.new(campus_attributes)
		campus2 = Campus.new(campus_attributes(address1: ""))

		expect(campus.valid?).to be_true
		expect(campus2.valid?).to be_false
	end

	it "properly returns a formatted address" do
		campus = Campus.new(campus_attributes)

		expect(campus.address).to eq("68 Princeton Street\n\nNorth Chelmsford, MA, 01863")
	end

end