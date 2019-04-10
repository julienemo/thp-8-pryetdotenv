require 'twitter'
require 'pry'
require 'dotenv'

Dotenv.load('.env')

# get 5 random handle to whom I'll need to tweet later

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
  if (n.to_i <= 0) || (n.to_i!= n)
    return "N must be positive integer."
  elsif n > x
    return "List too short for N."
  else
    target = target_range.sample(n)
    return target
  end
end

target_range = [ '@gem', '@ORTHOGRAMM', '@Projet_Voltaire', '@Quora', '@ARTEfr', '@operadeparis', '@theatrechatelet', '@polewebmairies', '@Mairiedu4e', '@gadelmaleh', '@lesmisofficial']
