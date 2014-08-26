
def post_an_image(title, price, address)
	visit '/posts'
	click_link 'New post'
	fill_in 'post[title]', with: title
	attach_file 'post[picture]', Rails.root.join('spec/images/gold_kicks.jpg')
	fill_in 'post[price]', with: price
	fill_in 'post[address]', with: address
	click_button 'Post kicks'
end