require "unirest"



response = Unirest.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")
employees = response.body

employees.each do |employee|
  puts employee["name"]
  puts employee["job_titles"]
  puts ""

end