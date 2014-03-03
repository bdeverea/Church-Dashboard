require 'spec_helper.rb'

describe "Editing Services" do
	it "saves the Service when fields are updated with valid values" do
		service = Service.create(service_attributes)

		visit edit_service_url(service)

		expect(find_field('Name').value).to eq(service.name)
		
    	fill_in 'Name', with: "Updated Service Name"
    	click_button 'Update Service'

    	expect(current_path).to eq(service_path(service))
	    expect(page).to have_text('Updated Service Name')
	    expect(page).to have_text(' successfully updated!')
	end
	
	it "does not save the Service when required fields contain invalid values" do 
		service = Service.create(service_attributes)

		visit edit_service_url(service)

		expect(find_field('Name').value).to eq(service.name)

		fill_in 'Name', with: ""
		click_button 'Update Service'

		expect(page).to have_text('Oops!')
		expect(page).to have_text('error')

		fill_in 'Name', with: "New Service Name"
		fill_in 'Description', with: ""

		click_button 'Update Service'

		expect(page).to have_text('Oops!')
		expect(page).to have_text('error')

		fill_in 'Description', with: "Sydney and Zoe are awesome and they are reading what I'm typing."

		click_button 'Update Service'

		expect(current_path).to eq(service_path(service))
		expect(page).to have_text("successfully updated!")

	end
end