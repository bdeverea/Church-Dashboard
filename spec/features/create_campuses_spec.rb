require 'spec_helper.rb'

describe "Creating Campuses" do

	it "saves the Campus after all required fields are valid" do
		visit new_campus_path

		fill_in "Name", with: "Harbor Main Campus"
		fill_in "Address1", with: "123 Princeton Blvd"
		fill_in "City", with: "North Chelmsford"
		fill_in "State", with: "MA"
		fill_in "Postal code", with: "01863"
		select("Canada", from: "Country")
		fill_in "Room Name", with: "Green Room"
		fill_in "Description", with: "Kids Harbor Room - Toddlers thru Pre-K"
		fill_in "Capacity", with: 15
		click_button "Create Campus"

		expect(page).to have_text("Harbor Main Campus")
		expect(current_path).not_to have_selector("form")
	end

	it "does not save the Campus if required fields are empty" do
		visit new_campus_path
		
		#Don't fill_in any fields
		#Room capacity defaults to 0

		click_button "Create Campus"
		expect(page).to have_text("Oops!")
		expect(page).to have_text("Please correct the following 9 errors")
	end

	it "does not save the Campus if it is invald" do
		visit new_campus_path

		fill_in "Name", with: "1"
		fill_in "Address1", with: "2" #too short (4)
		fill_in "City", with: "" #can't be blank
		fill_in "State", with: "MASSACHUSETTS" #too long (2)
		fill_in "Postal code", with: "ASDF" #must be numbers
		fill_in "Room Name", with: ""
		fill_in "Description", with: ""
		fill_in "Capacity", with: -1

		click_button "Create Campus"
		expect(page).to have_text("Oops!")
		expect(page).to have_text("Please correct the following 7 errors")
	end

end