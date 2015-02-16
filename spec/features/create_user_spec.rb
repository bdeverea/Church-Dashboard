require 'spec_helper'

describe "Creating a user" do
  it "saves the user after all required fields are valid" do
    visit new_user_url

    fill_in "First name", with: "Tony"
    fill_in "Last name", with: "Stark"
    fill_in "Email", with: "ironman@starkindustries.com"
    fill_in "Password", with: "super_secret"
    fill_in "Password confirmation", with: "super_secret"

    click_button "Create User"

    expect(page).to have_text(" successfully created")
    expect(page).not_to have_selector('form')
  end

  it "does not save the user if required fields are invalid" do
    visit new_user_url

    click_button "Create User"

    expect(page).to have_text("Oops!")
    expect(page).to have_selector('#errors')
  end

end