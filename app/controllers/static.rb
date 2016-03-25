# let user create new short URL
# display a list of shortened URLs
get '/' do
	erb :"static/index"
end

# create a new url
post '/urls' do # original_url is assigned to long
	@url = Url.new(long: params[:original_url])
	@url.save
	redirect '/'
end

get '/:short_url' do
	url = Url.find_by short: params[:short_url]
	url.update(click_count: url.click_count + 1)
	redirect url.long
end


# - GET when the user input is passive (eg. search engine), 
# and without sensitive information.
# the input will be visible in the page address

# - POST when updating data, or
# includes sensitive information (password)

# to CHECK database
# enter irb
# Url.all

# to DELETE shortened history,
# enter irb
# Url.all.destroy_all