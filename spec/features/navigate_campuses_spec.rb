require 'spec_helper.rb'

describe "Navigating Campuses" do

	it "allows navigation from the list page to the detail page" do
		campus = Campus.create(campus_attributes)

		visit 'http://example.com/campuses'

		expect(page).to have_text("1 Campus")
		click_link campus.name

		expect(page).to have_text(campus.address)
	end

	it "allows navigation from the list page to the create page" do
		visit campuses_url

		click_link "Add Campus"

		expect(current_path).to eq(new_campus_path)
		expect(page).to have_selector('form')
		expect(page).to have_text("Create a Campus")
	end

	it "allows navigation from the create page to the list page" do
		visit new_campus_url

		click_link "Cancel"

		expect(current_path).to eq(campuses_path)
		expect(page).to have_selector('ul')
		expect(page).to have_text("Campus")
	end

	it "allows navigation from the detail page to the list page" do
		campus = Campus.create(campus_attributes)

		visit campus_path(campus)
		# visit 'http://example.com/campuses/1'

		click_link ("All Campuses")
		expect(page).to have_text("1 Campus")
	end

	it "allows navigation from the list page to the create page" do
		campus = Campus.create(campus_attributes)

		visit 'http://example.com/campuses'
		expect(page).to have_text("1 Campus")

		click_link("Add Campus")
		expect(page).to have_text("Create a Campus")
		expect(page).to have_selector('form')
	end

	it "allows navigation from the create page to the list page" do
		visit 'http://example.com/campuses/new'

		expect(page).to have_text('Create a Campus')
		expect(page).to have_selector('form')

		click_link('Cancel')
		expect(page).to have_text('0 Campuses')
	end

	it "allows navigation from the detail page to the edit page" do
		campus = Campus.create(campus_attributes)

		visit campus_url(campus)
		# visit 'http://example.com/campuses/1'

		expect(page).to have_text(campus.name)

		click_link('Edit')
		expect(page).to have_text("Edit Campus")
		expect(page).to have_selector('form')
	end

	it "allows navigation from the edit page to the list page" do
		campus = Campus.create(campus_attributes)

		visit edit_campus_url(campus)
		expect(page).to have_text("Edit Campus")
		expect(page).to have_selector('form')

		click_link('Cancel')
		expect(page).to have_text('1 Campus')
	end

	it "redirects to the list page after deleting a campus" do
		campus = Campus.create(campus_attributes)

		visit campus_path(campus)

		click_link('Delete')

		expect(current_path).to eq(campuses_path)
	end
end