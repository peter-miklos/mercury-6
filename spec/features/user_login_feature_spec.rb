require 'rails_helper'

feature "user login - " do

  context "user not signed in - " do
    scenario "login and sign up links are present" do
      visit "/"
      expect(page).to have_content("Sign up")
      expect(page).to have_content("Log in")
    end

    scenario "'sign out' link not available" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in - " do
    before do
      sign_up
      visit('/')
    end

    scenario "sees 'log out' link and user email in nav bar" do
      expect(page).to have_link('Log out')
      expect(page).to have_css("li", text: "Signed in as test@example.com")
    end

    scenario "should not see a 'sign in' link and a 'sign up' link" do
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
