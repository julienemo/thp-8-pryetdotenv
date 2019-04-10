require 'twitter'
require 'pry'
require 'dotenv'


Dotenv.load('../.env')

#  client.follow("gem") entre parenthese handle sans @ or n compte
# .favorite(list de tweet selectionnes)
def login_twitter
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
end

def golike(hashtag,n)
# if enters a keyword without '#'
# adds # to it
  unless hashtag[0] == "#"
    hashtag = "##{hashtag}"
  end

  client = login_twitter
# this is how you find a tweet by keyword
# not necessarily hashtag
  like_list = client.search(hashtag).take(n)
  like_list.each do |tweet|

# this is how you like a tweet
    client.favorite(tweet)
  end

end

def gofollow(hashtag,n)
  # if enters a keyword without '#'
  # adds # to it
  unless hashtag[0] == "#"
    hashtag = "##{hashtag}"
  end

# didn't find a way to directly trace the person who twitts
# had to go through the tweet
  client = login_twitter
  like_list = []

# go search all new tweets and give back the user
  client.search(hashtag).each do |tweet|
    user = tweet.user.id

# if the user isn't already in the list
# and if the list is not full
# put the user in the list
    unless (like_list.include?(user))||(like_list.length > n-1)
      like_list << user
    end
  end

  like_list.each do |user|

# this is how you follow a person
    client.follow(user)
  end
end

=begin
def gostreaming(hashtag,n)
  # if enters a keyword without '#'
  # adds # to it
  unless hashtag[0] == "#"
    hashtag = "##{hashtag}"
  end

  client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end

  client.filter(track: hashtag) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end



end

gostreaming('bestfriends',5)
# client.search("to:justinbieber marry me", result_type: "recent").first.user.id_str
=end
