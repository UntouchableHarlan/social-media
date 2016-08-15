require 'rails_helper'

feature 'Visiting the Registration Page' do
  it "register a user uopn a click button" do
    visit signup_path
    find_field "First name"
    fill_in "First name", with: "Peter"
    find_field "Last name"
    fill_in "First name", with: "Pan"
    find_field "Email"
    fill_in "Email", with: "pp@gmail.com"
    find_field "Password"
    fill_in "Password", with: "asdf"
    fill_in "Password confirmation", with: "asdf"
    click_button "Sign Up"
  end
end
