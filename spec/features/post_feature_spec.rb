require 'rails_helper'

describe 'posts' do

	context 'When there are no posts' do
		it 'shows a message' do
			visit '/posts'
			expect(page).to have_content 'There are no posts yet'
		end
	end

	context "When there are posts" do
		before(:each) do
			Post.create(title: 'Hello World')
		end

		it 'displays a list of all the posts' do
			visit '/posts'
			expect(page).to have_content 'Hello World'
		end
	end

	describe 'creating a post' do

		it 'creates the post from a form' do
			sign_up
			click_link 'New post'
			fill_in 'post[title]', with: 'Check these sneakers!'
			click_button 'Post kicks'

			expect(page).to have_content 'Check these sneakers!'
			expect(current_path).to eq '/posts'
		end

		it 'displays no image, if no picture attached' do
			sign_up
			click_link 'New post'
			fill_in 'post[title]', with: 'Check these sneakers!'
			click_button 'Post kicks'

			expect(page).not_to have_css 'img.uploaded-pic'
		end
		

		it 'can attach an image to a post' do
			sign_up
			visit '/posts'
			click_link 'New post'
			fill_in 'post[title]', with: 'Check these sneakers!'
			attach_file 'post[picture]', Rails.root.join('spec/images/gold_kicks.jpg')
			click_button 'Post kicks'

			expect(page).to have_css 'img.uploaded-pic'
		end

		it 'display the location given by the user' do
			sign_up
			visit '/posts'
			click_link 'New post'
			fill_in 'post[title]', with: 'Check these sneakers!'
			attach_file 'post[picture]', Rails.root.join('spec/images/gold_kicks.jpg')
			fill_in 'post[price]', with: '£5.99'
			fill_in 'post[address]', with: 'London, UK'
			click_button 'Post kicks'

			expect(page).to have_content 'Sent from London, UK'
		end

		it 'can have a price associated with it' do
			sign_up
			visit '/posts'
			click_link 'New post'
			fill_in 'post[title]', with: 'Check these sneakers!'
			attach_file 'post[picture]', Rails.root.join('spec/images/gold_kicks.jpg')
			fill_in 'post[price]', with: '£5.99'
			click_button 'Post kicks'

			expect(page).to have_content '£5.99'
		end
	end



end
