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

post_split = post.split
post = post_split.join("_")
p post
post_id = posts[post_index]["data"]["id"]

response = Unirest.get("https://www.reddit.com/r/#{sub_reddit}/comments/#{post_id}/.json")
comments_body = response.body[1]["data"]["children"]



#need to display comments section now
def comments(array,spacing)
    comment_array = array
    new_spacing = spacing
    comment_array.each do |comment|
     post_body = comment["data"]["body"]
     replies = comment["data"]["replies"]
     puts new_spacing + comment["data"]["author"].to_s + ": "
     puts new_spacing + post_body.to_s
      if comment["data"]["replies"] != ""
        comment_index = comment_array.index(comment)
        if comment["kind"] != "more" and comment_array[comment_index]["data"]["replies"]["data"]["children"][0]["kind"] != "kind"
          new_spacing = new_spacing + "   "
          comment_array = comment_array[comment_index]["data"]["replies"]["data"]["children"]
          #p comment_array
          puts
          comments(comment_array,new_spacing)
        end
     end 
     new_spacing = spacing
     comment_array = array
     puts
    end
end
 comments(comments_body,"")


