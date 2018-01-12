require "unirest"

looking_up_words = true


while looking_up_words


  system "clear"
  puts "All the words by Nathan Knautz"
  puts
  print "Enter a word: "
  word = gets.chomp

  if word == "q" 
    looking_up_words = false
  else

    definition_response  = Unirest.get("http://api.wordnik.com/v4/word.json/#{word}/definitions?limit=10&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

    definitions = definition_response.body
    puts "Definitions"
    puts "-" * 70
    definitions.each.with_index do |definition, index|
      puts "#{index + 1} - #{definition["text"]}"
    end 

    puts
    puts

    top_example_response = Unirest.get("http://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

    top_example = top_example_response.body["text"]

    puts "TOP EXAMPLE"
    puts "-" * 70
    puts top_example

    pronunciations_response = Unirest.get("http://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=10&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

    pronunciations = pronunciations_response.body

    puts "PRONOUNCIATIONS"
    puts "-" * 70
    pronunciations.each do |pronoun|
      puts pronoun["raw"]
    end 
  

end



