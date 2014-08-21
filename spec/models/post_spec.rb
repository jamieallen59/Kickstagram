require 'rails_helper'

describe '#tags_list=' do

	let (:post) { Post.create(title: 'Example post') }

	context 'no tags provided' do
		it 'gives 0 tags to the post' do
			post.tags_list = ''
			expect(post.tags).to be_empty
		end
	end

	context 'with 1 tag' do
		it 'adds that tag to the post' do
			post.tags_list = '#ROFL'
			expect(post.tags.first.text).to eq '#ROFL'
		end
	end

	context 'with multiple tags' do
		it 'adds all the tags separately' do
			post.tags_list = '#ROFL, #lovedemsneakers'
			expect(post.tags.count).to eq 2
		end
	end

	context 'with existing tags' do

		before(:each) { Tag.create(text: '#ROFL') }
	
		it 'reuses them' do
			post.tags_list = '#ROFL, #lovedemsneakers'
			expect(Tag.count).to eq 2
		end
	end

	context 'with duplicate tags' do
		it 'it deduplicates them' do
			post.tags_list = '#ROFL, #lovedemsneakers, #ROFL'
			expect(post.tags.count).to eq 2
		end
	end

end




