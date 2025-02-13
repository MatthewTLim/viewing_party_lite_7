require 'rails_helper'

RSpec.describe 'New User' do
  before :each do
    @user_1 = User.create!(name: "User1", email: "email1@example.com")
    @user_2 = User.create!(name: "User2", email: "email2@example.com")
    @user_3 = User.create!(name: "User3", email: "email3@example.com")
  end
  describe 'happy path' do
    it 'can register a new user' do
      visit root_path
      expect(page).to_not have_content("Ralph")
      visit "/register"

      fill_in "Name", with: "Ralph"
      fill_in "Email", with: "lol@yahoo.com"
      click_button "Register"
      new_user = User.find_by(email: "lol@yahoo.com")
      expect(current_path).to eq(user_path(new_user))
      expect(page).to have_content("User successfully created.")
      
      visit root_path
      expect(page).to have_content("Ralph")
    end
  end

  describe 'sad path' do
    it 'can register a new user' do
      visit root_path
      expect(page).to_not have_content("Ralph")
      visit "/register"

      fill_in "Name", with: "Ralph"
      fill_in "Email", with: "email2@example.com"
      click_button "Register"

      expect(page).to have_content("Email has already been taken")
      
      visit root_path
      expect(page).to_not have_content("Ralph")
    end
  end
end