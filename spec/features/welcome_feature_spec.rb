require 'rails_helper'

describe 'users experience' do

	context 'when users is logged out' do

		it 'when visiting challenge.me index page users see homepage' do
			visit '/'
			expect(page).to have_content "FUNDRAISING JUST GOT FUN"
		end

		it 'when landing on homepage expect to see search box' do
			visit '/'
			expect(page).to have_css 'input.find_person'
		end

		it "they don't see a sign out button" do
			visit '/'
			expect(page).not_to have_link 'SIGN OUT'
		end
	end

	context 'when users is logged in' do
		before do
			@mary = create(:user)
			login_as @mary
		end

		it "when landing on homepage expect to see START  button, takes them to select an event" do
				visit '/'
				expect(page).to have_link("START", href: select_events_path)
		end

		it 'when visiting challenge.me users can log out' do
			visit '/'
			expect(page).to have_link 'SIGN OUT'
		end

		it 'does not display any sort of welcome message' do
			visit '/'
			expect(page).not_to have_content 'Logged in as maryperfect@challengme.com'
		end
	end
end