require 'rails_helper'

feature "Create Game", :type => :feature do 
	let!(:user) {User.create!(email:"bla@test.com", username:"bla", password:"foobar123")}

	scenario "User must be logged in" do
		visit "/games/new"

		expect(page).to have_text("You need to sign in or sign up before continuing")
	end

	scenario "User must be logged in" do
		visit "/games/new"

		fill_in "user_email", with: "bla@test.com"
		fill_in "user_password", with: "foobar123"

		click_button "Sign in"

		expect(page).to have_text("Start a Game")
	end

	scenario "User creates new challenge pt 1" do
		visit "/challenges/new"

		fill_in "user_email", with: "bla@test.com"
		fill_in "user_password", with: "foobar123"

		click_button "Sign in"

		fill_in "challenge_title", with: "Test-Title"

		click_button "Create Challenge"

		expect(page).to have_text("This is the challenge: Test-Title")
	end

	scenario "User creates new challenge pt 2" do
		visit "/challenges/new"

		fill_in "user_email", with: "bla@test.com"
		fill_in "user_password", with: "foobar123"

		click_button "Sign in"

		fill_in "challenge_title", with: "Test-Title"

		click_button "Create Challenge"

		fill_in "phrase_text", with: "Test-Phrase"

		click_button "Create Phrase"

		expect(page).to have_text("Test-Phrase")
	end

end