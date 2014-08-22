require 'rails_helper'

describe 'The initial experience' do

	context 'for any user' do
		it 'should display a sign up option' do
			visit '/'
			expect(page).to have_content 'Sign up'
		end

		it 'should display a log in option' do
			visit '/'
			expect(page).to have_content 'Log in'
		end
	end


	describe 'Signing up to Insta-kick' do
		it 'will allow the user to sign up' do
			sign_up

			expect(page).to have_content 'New post'
			expect(current_path).to eq '/'
		end
	end

	describe 'Logging in as an existing user' do
		it 'will allow the user to log in using their existing details' do
			jamie = User.create(email: 'jamie@gmail.com', password: '12345678', password_confirmation: '12345678')
			visit '/'
			click_link 'Log in'
			fill_in 'user[email]', with: 'jamie@gmail.com', match: :prefer_exact
			fill_in 'user[password]', with: '12345678', match: :prefer_exact
			click_button 'Log in'

			expect(page).to have_content 'New post'
			expect(current_path).to eq '/'
		end
	end

end

