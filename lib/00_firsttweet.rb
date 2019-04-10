require 'twitter'
require 'dotenv'
Dotenv.load('../.env')

#def login_twitter
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
#end

client.update("Avoir la mélodie de le postillon de longjumeau dans la tête depuis dimanche.")
