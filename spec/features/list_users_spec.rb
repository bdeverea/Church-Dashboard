require 'spec_helper'

describe "Viewing list of users in alphabetical order by last name" do
  
  it "lists the users" do
    user1 = User.create!(user_attributes(first_name: "Larry", last_name: "Bird", email: "lbird@celtics.com"))
    user2 = User.create!(user_attributes(first_name: "Mike", last_name: "Jordan", email: "mj@nike.com"))
    user3 = User.create!(user_attributes(first_name: "Magic", last_name: "Johnson", email: "magic@lakers.com"))

    visit users_url

    page.should have_selector("ul li:nth-child(1)", text: user1.last_name)
    page.should have_selector("ul li:nth-child(2)", text: user3.last_name)
    page.should have_selector("ul li:nth-child(3)", text: user2.last_name)
  end



end