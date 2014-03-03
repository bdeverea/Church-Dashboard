require 'spec_helper'

describe "Deleting a Campus" do 

	it "removes the Campus from the database" do
		campus = Campus.create(campus_attributes)

		visit campus_path(campus)

		click_link 'Delete'

		expect(current_path).to eq(campuses_path)
		expect(page).to have_text("#{campus.name} has been successfully deleted!")
	end
	
end