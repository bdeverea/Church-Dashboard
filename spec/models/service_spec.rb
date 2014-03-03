require 'spec_helper'

describe "A Service" do
	it "has many events" do
		service = Service.new(service_attributes)

		event1 = service.events.new(event_attributes)
		event2 = service.events.new(event_attributes)

		expect(service.events).to include(event1)
		expect(service.events).to include(event2)
	end

	it "deletes associated events" do
		service = Service.create(service_attributes)
		event = service.events.create(event_attributes)

		expect { 
	    	service.destroy
	  	}.to change(Event, :count).by(-1)
	end

	it "requires a name" do
		service = Service.create()
		service2 = Service.create(name: "Saturday Service", description: 'Test description' )

		expect(service.valid?).to be_false
		expect(service2.valid?).to be_true
	end
	
	it "requires a unique name" do
		service = Service.create(name: 'Saturday Service', description: 'Test description')
		service2 = Service.create(name: service.name, description: 'Test description')

		expect(service.valid?).to be_true
		expect(service2.valid?).to be_false
	end

	it "requires a description" do
		service = Service.create(name: 'Saturday Service', description: 'Test description')
		service2 = Service.create(name: 'Invalid Service')

		expect(service.valid?).to be_true
		expect(service2.valid?).to be_false

	end
	
	it "rejects a description of less than 10 characters" do
		service = Service.create(name: 'Saturday Service', description: '1')
		service2 = Service.create(name: 'Saturday Service', description: 'Test description')

		expect(service.valid?).to be_false
		expect(service2.valid?).to be_true
	end

end