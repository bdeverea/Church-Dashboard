require "spec_helper"

describe "Deleting a User" do
  it "removes the user from the database and displays the list page" do
    user1 = User.create!(user_attributes)

    visit user_path(user1)

    click_link "Delete"

    expect(current_path).to eq(users_path)
    expect(page).to have_text("successfully deleted")

  end
end