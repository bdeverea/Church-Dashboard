require 'spec_helper'

describe "Navigating services" do 

	it "allows navigation from the list page to the details page" do
		service = Service.create(service_attributes)

		visit services_url
		click_link (service.name)

		expect(page).to have_text(service.name)
	end

	it "allows navigation from the details page to the list page" do
		service = Service.create(service_attributes)

		visit service_url(service)
		click_link ("All Services")

		expect(page).to have_text("1 Service")
	end

	it "allows navigation from the details page to the edit page" do
		service = Service.create(service_attributes)

		visit service_url(service)
		click_link ("Edit")

		expect(page).to have_text("Edit Service")
	end

	it "allows navigation from the list page to the create Service page" do
		visit services_url
		click_link ("Create Service")

		expect(page).to have_text("Create a Service")
	end

	it "allows navigation from the create page to the list page" do
		visit new_service_url
		click_link ("Cancel")

		expect(page).to have_text("0 Services")
	end

	it "redirects to the list page after deleting a service" do
		service = Service.create(service_attributes)

		visit service_path(service)

		click_link('Delete')

		expect(current_path).to eq(services_path)
	end
	
end