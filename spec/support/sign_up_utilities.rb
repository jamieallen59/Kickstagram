def sign_up
	visit '/'
	click_link 'Sign up'
	fill_in 'user[email]', with: 'jamie@gmail.com'
	fill_in 'user[password]', with: '12345678'
	fill_in 'user[password_confirmation]', with: '12345678'
	click_button 'Sign up'
end