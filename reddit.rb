require "unirest"

system "Clear"


puts "Hello friend, what subreddit would you like to look at?"
sub_reddit = gets.chomp

response = Unirest.get("https://www.reddit.com/r/#{sub_reddit}/.json")

posts = response.body["data"]["children"]

posts.each.with_index do |post, index|
  puts "#{index + 1} - #{post["data"]["title"]}"
end 

puts "Enter the post you want to see comments for:"
post_index = gets.chomp.to_i - 1

post = posts[post_index]["data"]["title"]
puts post 
