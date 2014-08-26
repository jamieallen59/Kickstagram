require 'rails_helper'

describe 'tagging posts' do

	it 'display tags as links under posts' do
		sign_up
		visit '/posts'
		click_link 'New post'
		fill_in 'post[title]', with: 'Check these sneakers!'
		fill_in 'post[tags_list]', with: '#ROFL, #lovedemsneakers'
		click_button 'Post kicks'

		expect(page).to have_content '#ROFL'
		expect(page).to have_content '#lovedemsneakers'
	end
end

describe 'filtering by tags' do
	before do
		Post.create(title: 'Post A', tags_list: '#ROFL, #lovedemsneakers')
		Post.create(title: 'Post B', tags_list: '#ROFL, #phresh')
	end

	it 'filters to show only tagged posts' do
		visit '/posts'
		click_link '#phresh'

		expect(page).to have_css 'h3', text: 'Posts tagged with #phresh'
		expect(page).to have_content 'Post B'
		expect(page).not_to have_content 'Post A'
	end

	it 'accessible via pretty URLs' do
		visit '/tags/ROFL'

		expect(page).to have_content 'Post A'
	end

end
