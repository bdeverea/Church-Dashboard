require 'spec_helper.rb'

describe "Creating Campuses" do
	
	it "saves the Campus after all required fields are valid" do
		visit new_campus_path

		fill_in "Name", with: "Harbor Main Campus"
		fill_in "Address1", with: "123 Princeton Blvd"
		click_button "Create Campus"

		expect(page).to have_text("Harbor Main Campus")
	end

	it "does not save the Campus if required fields are empty" do
		visit new_campus_path
		#Don't fill_in any fields

		click_button "Create Campus"
		expect(page).to have_text("Oops!")
		expect(page).to have_text("error")
	end

	it "does not save the Campus if it is invald" do
		visit new_campus_path

		fill_in "Name", with: "1"
		fill_in "Address1", with: "2"

		click_button "Create Campus"
		expect(page).to have_text("Oops!")
		expect(page).to have_text("error")
	end

end