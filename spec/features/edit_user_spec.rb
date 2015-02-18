require "spec_helper"

describe "Editing a User" do 
  it "updates the user and displays the updated user details" do
    user1 = User.create!(user_attributes)

    visit user_url(user1)

    click_link "Edit"

    expect(current_path).to eq(edit_user_path(user1))
    expect(find_field("First name").value).to eq(user1.first_name)

    fill_in "First name", with: "Roberto"

    click_button "Update User"

    expect(current_path).to eq(user_path(user1))
    expect(page).to have_text("Roberto")
    expect(page).to have_text("successfully updated")
  end

  it "does not update the user if it's invalid" do
    user1 = User.create!(user_attributes)

    visit user_url(user1)

    click_link "Edit"

    expect(current_path).to eq(edit_user_path(user1))
    expect(find_field("First name").value).to eq(user1.first_name)

    fill_in "Email", with: ""

    click_button "Update User"

    expect(page).to have_text("Oops!")
    expect(page).to have_selector("form")
  end

end