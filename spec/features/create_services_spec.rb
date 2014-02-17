require 'spec_helper.rb'

describe "Creating Services" do
	
	it "saves the Service after all required fields are submitted" do
		visit "http://example.com/services/new"

		fill_in "Name", with: "Saturday 5pm Service"
		fill_in "Description", with: "Harbor's Saturday evening service."
		click_button "Create Service"

		expect(page).to have_text("Saturday 5pm Service")
	end
	
	it "does not save the Service if required fields are empty" do
		visit new_service_url

		fill_in "Name", with: ""
		fill_in "Description", with: ""
		click_button "Create Service"

		expect(page).to have_text("error")

	end
	
	it "does not save the Service if required fields contain invalid values" do
		visit new_service_url

		fill_in "Name", with: "Valid Name"
		fill_in "Description", with: "too short"
		click_button "Create Service"

		expect(page).to have_text("Oops!")
		expect(page).to have_text("error")
	end

end