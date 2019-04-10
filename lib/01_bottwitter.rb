require 'twitter'
require 'pry'
require 'dotenv'


def login_twitter
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
end

def go_tweet(target_range,n)
  x = target_range.length
# data validation : no string, no float, no <=0
  if (n.to_i <= 0) || (n.to_i!= n)
    return "N must be positive integer."
# date validation : N can't be larger than list length
  elsif n > x
    return "List too short for N."
  else
# this is THE solution to choose n random items from an array
    target = target_range.sample(n)
    client = login_twitter
    target.each do |tweet_target|
      client.update("#{tweet_target} Greetings! #bonjour_monde")
    end
  end
end

target_range = [ '@gem', '@ORTHOGRAMM', '@Projet_Voltaire', '@Quora', '@ARTEfr', '@operadeparis', '@theatrechatelet', '@polewebmairies', '@Mairiedu4e', '@gadelmaleh', '@lesmisofficial']
go_tweet(target_range,3)
