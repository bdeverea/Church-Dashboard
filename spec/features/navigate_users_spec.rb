require 'spec_helper'

describe "Navigating users" do

  it 'allows navigation from the list page to the details page' do
    user1 = User.create!(user_attributes)
    
    visit users_url

    click_link(user1.name)

    expect(page).to have_text(user1.name)
    expect(current_path).to eq(user_path(user1))

  end

  it 'allows navigation from the details page to the list page' do
    user1 = User.create!(user_attributes)

    visit user_url(user1)

    click_link("All Users")

    expect(page).to have_text('1 User')
    expect(current_path).to eq(users_path)
  end

  it 'allows navigation from the list page to the create page' do
    user1 = User.create!(user_attributes)

    visit users_url

    click_link("Create User")

    expect(page).to have_selector('form')
    expect(page).to have_text('Create a User')
    expect(current_path).to eq(new_user_path)
  end

  it 'allows navigation from the create page to the list page' do
    visit new_user_url

    click_link("Cancel")

    expect(page).to have_text('0 Users')
    expect(current_path).to eq(users_path)
  end

  it 'allows navigation from the details page to the edit page' do  
    user1 = User.create!(user_attributes)

    visit user_url(user1)

    click_link("Edit")

    expect(page).to have_selector('form')
    expect(page).to have_text("Edit ")
    expect(current_path).to eq(edit_user_path(user1))

  end

  it 'allows navigation from the edit page to the details page' do
    user1 = User.create!(user_attributes)

    visit edit_user_url(user1)

    click_link("Cancel")

    expect(current_path).to eq(user_path(user1))
  end
  it 'allows navigation from the edit page to the list page' do
    user1 = User.create!(user_attributes)

    visit edit_user_url(user1)

    click_link("All Users")

    expect(current_path).to eq(users_path)
  end

end