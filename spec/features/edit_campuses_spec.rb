require 'spec_helper.rb'

describe "Editing a Campus" do
	
	it "saves the updated Campus when required fields are valid" do
		campus = Campus.create(campus_attributes)

		visit edit_campus_path(campus)

		expect(find_field('Name').value).to eq(campus.name)
		
    	fill_in 'Name', with: "Updated Campus Name"
    	click_button 'Update Campus'

    	expect(current_path).to eq(campus_path(campus))
	    expect(page).to have_text('Updated Campus Name')
	    expect(page).to have_text(' successfully updated!')
	end

	it "does not save the Campus when required fields are invalid" do
		campus = Campus.create(campus_attributes)

		visit edit_campus_path(campus)

		expect(find_field('Name').value).to eq(campus.name)
		
    	fill_in 'Name', with: "1"
    	click_button 'Update Campus'

	    expect(page).to have_text('Oops!')
	    expect(page).to have_text('error')
	end

end