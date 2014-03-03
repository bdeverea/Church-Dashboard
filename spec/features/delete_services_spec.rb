require 'spec_helper'

describe "Deleting a Service" do
	
	it "removes the Service from the database" do
		service = Service.create(service_attributes)

		visit service_path(service)

		click_link 'Delete'

		expect(current_path).to eq(services_path)
		expect(page).to have_text("#{service.name} has been successfully deleted!")
	end
end