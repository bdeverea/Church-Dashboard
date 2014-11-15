require 'spec_helper'

describe "Viewing a user's profile page" do 
  it "shows the user's details" do
    user1 = User.create!(user_attributes)

    visit user_url(user1)

    expect(page).to have_text(user1.name)
    expect(page).to have_text(user1.email)
  end

  it "provides a link to the user's email address" do
    user1 = User.create!(user_attributes)

    visit user_url(user1)

    expect(page).to have_link(user1.email)
  end
end