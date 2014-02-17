require 'spec_helper'

describe "Viewing list of services" do
	
	it "lists the services in date order" do
		service1 = Service.create(service_attributes)
		service2 = Service.create(service_attributes(name: 'Sunday 9:30am Service'))
		service3 = Service.create(service_attributes(name: 'Sunday 11am Service'))

		visit 'http://example.com/services'

		expect(page).to have_text('3 Services')
		page.should have_selector("ol li:nth-child(1)", text: service1.name)
		page.should have_selector("ol li:nth-child(2)", text: service2.name)
		page.should have_selector("ol li:nth-child(3)", text: service3.name)
	end

end