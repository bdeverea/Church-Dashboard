require 'spec_helper'

describe "A Campus" do
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

	it "requires a valid address1" do
		campus = Campus.new(campus_attributes)
		campus2 = Campus.new(campus_attributes(address1: ""))
		campus3 = Campus.new(campus_attributes(address1: "123"))

		expect(campus.valid?).to be_true
		expect(campus2.valid?).to be_false
		expect(campus3.valid?).to be_false
	end

	it "properly returns a formatted address" do
		campus = Campus.new(campus_attributes)

		expect(campus.address).to eq("68 Princeton Street\n\nNorth Chelmsford, MA, 01863")
	end

end