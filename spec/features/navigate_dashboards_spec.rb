require 'spec_helper'

describe "Navigating Dashboards" do
  it "makes Dashboard the root path of the application" do
    visit "http://example.com"

    expect(page).to have_selector("header>h1")
    expect(page).to have_selector("#chart-ytd-attendance")
  end

end