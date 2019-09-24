require 'rest-client'
require 'json'
require 'pry'
require 'faker'
Truck.delete_all
User.delete_all

120.times do 

User.create(
firstName: Faker::Name.unique.first_name,   
lastName: Faker::Name.unique.last_name, 
username: Faker::Internet.username(specifier: @firstName),
role: Faker::Number.within(range: 0..1),
email: Faker::Internet.email(name: @firstName),
password: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
)
end



# 
#######################one####################################
url1 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=1&limit=20"
response1 = RestClient.get(url1, headers={Authorization: "Bearer #{ENV["yelp_secret_access_key"]}"})
json1 = JSON.parse(response1)
# binding.pry
i = 0 
while i < 20 do 
Truck.create(
name: json1["businesses"][i]["name"],
user_id: User.all.select{|u| u.owner? == true}.sample.id, 
image_url: json1["businesses"][i]["image_url"], 
url: json1["businesses"][i]["url"], 
review_count: json1["businesses"][i]["review_count"],
rating: json1["businesses"][i]["rating"],
latitude: json1["businesses"][i]["coordinates"]["latitude"],
longitude: json1["businesses"][i]["coordinates"]["longitude"], 
price: json1["businesses"][i]["price"],
display_location: json1["businesses"][i]["location"]["display_address"])
i +=  1
end 

#######################two####################################
url2 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=2&limit=20"
response2 = RestClient.get(url2, headers={Authorization: "Bearer #{ENV["yelp_secret_access_key"]}"})
json2 = JSON.parse(response2)
u = 0
while u < 20 do 
Truck.create(
name: json2["businesses"][u]["name"],
user_id: User.all.select{|u| u.owner? == true}.sample.id, 
image_url: json2["businesses"][u]["image_url"], 
url: json2["businesses"][u]["url"], 
review_count: json2["businesses"][u]["review_count"],
rating: json2["businesses"][u]["rating"],
latitude: json2["businesses"][u]["coordinates"]["latitude"],
longitude: json2["businesses"][u]["coordinates"]["longitude"], 
price: json2["businesses"][u]["price"],
display_location: json2["businesses"][u]["location"]["display_address"])
u +=  1
end 
#######################three####################################
url3 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=3&limit=20"
response3 = RestClient.get(url3, headers={Authorization: "Bearer #{ENV["yelp_secret_access_key"]}"})
json3 = JSON.parse(response3)
a = 0
while a < 20 do 
Truck.create(
name: json3["businesses"][a]["name"],
user_id: User.all.select{|u| u.owner? == true}.sample.id, 
image_url: json3["businesses"][a]["image_url"], 
url: json3["businesses"][a]["url"], 
review_count: json3["businesses"][a]["review_count"],
rating: json3["businesses"][a]["rating"],
latitude: json3["businesses"][a]["coordinates"]["latitude"],
longitude: json3["businesses"][a]["coordinates"]["longitude"], 
price: json3["businesses"][a]["price"],
display_location: json3["businesses"][a]["location"]["display_address"])
a +=  1
end 
#######################four####################################
url4 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=4&limit=20"
response4 = RestClient.get(url4, headers={Authorization: "Bearer #{ENV["yelp_secret_access_key"]}"})
json4 = JSON.parse(response4)
b = 0
while b < 20 do 
Truck.create(
name: json4["businesses"][b]["name"],
user_id: User.all.select{|u| u.owner? == true}.sample.id, 
image_url: json4["businesses"][b]["image_url"], 
url: json4["businesses"][b]["url"], 
review_count: json4["businesses"][b]["review_count"],
rating: json4["businesses"][b]["rating"],
latitude: json4["businesses"][b]["coordinates"]["latitude"],
longitude: json4["businesses"][b]["coordinates"]["longitude"], 
price: json4["businesses"][b]["price"],
display_location: json4["businesses"][b]["location"]["display_address"])
b +=  1
end 
#######################five####################################
url5 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=5&limit=20"
response5 = RestClient.get(url5, headers={Authorization: "Bearer #{ENV["yelp_secret_access_key"]}"})
json5 = JSON.parse(response3)
c = 0
while c < 20 do 
Truck.create(
name: json5["businesses"][c]["name"],
user_id: User.all.select{|u| u.owner? == true}.sample.id, 
image_url: json5["businesses"][c]["image_url"], 
url: json5["businesses"][c]["url"], 
review_count: json5["businesses"][c]["review_count"],
rating: json5["businesses"][c]["rating"],
latitude: json5["businesses"][c]["coordinates"]["latitude"],
longitude: json5["businesses"][c]["coordinates"]["longitude"], 
price: json5["businesses"][c]["price"],
display_location: json5["businesses"][c]["location"]["display_address"])
c +=  1
end 
#######################six####################################
url6 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=6&limit=20"
response6 = RestClient.get(url6, headers={Authorization: "Bearer #{ENV["yelp_secret_access_key"]}"})
json6 = JSON.parse(response6)
d = 0
while d < 20 do 
Truck.create(
name: json6["businesses"][d]["name"],
user_id: User.all.select{|u| u.owner? == true}.sample.id, 
image_url: json6["businesses"][d]["image_url"], 
url: json6["businesses"][d]["url"], 
review_count: json6["businesses"][d]["review_count"],
rating: json6["businesses"][d]["rating"],
latitude: json6["businesses"][d]["coordinates"]["latitude"],
longitude: json6["businesses"][d]["coordinates"]["longitude"], 
price: json6["businesses"][d]["price"],
display_location: json6["businesses"][d]["location"]["display_address"])
d +=  1
end 







   