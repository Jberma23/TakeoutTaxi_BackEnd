# require 'rest-client'
# require 'json'
# require 'pry'
require 'faker'
# require 'geocoder'
require 'byebug'
# Truck.delete_all
# User.delete_all
# Review.delete_all
# Rating.delete_all
# Favorite.delete_all



# 120.times do 

# User.create(
# firstName: Faker::Name.unique.first_name,   
# lastName: Faker::Name.unique.last_name, 
# username: Faker::Internet.username(specifier: @firstName),
# role: Faker::Number.within(range: 0..1),
# email: Faker::Internet.email(name: @firstName),
# password: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
# )
# end

# ######################one####################################
# url1 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=1&limit=20"
# response1 = RestClient.get(url1, headers={Authorization: "Bearer "})
# json1 = JSON.parse(response1)
# # binding.pry
# i = 0 
# while i < 20 do 
# Truck.create(
# name: json1["businesses"][i]["name"],
# user_id: User.all.sample.id, 
# image_url: json1["businesses"][i]["image_url"], 
# url: json1["businesses"][i]["url"], 
# review_count: json1["businesses"][i]["review_count"],
# rating: json1["businesses"][i]["rating"],
# latitude: Geocoder.search(json1["businesses"][i]["location"]["display_address"][0]).first.coordinates[0],
# longitude: Geocoder.search(json1["businesses"][i]["location"]["display_address"][0]).first.coordinates[1], 
# price: json1["businesses"][i]["price"],
# address: json1["businesses"][i]["location"]["display_address"])
# i +=  1
# end 

# ######################two####################################
# url2 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=2&limit=20"
# response2 = RestClient.get(url2, headers={Authorization: "Bearer "})
# json2 = JSON.parse(response2)
# u = 0



# while u < 20 do 
# Truck.create(
# name: json2["businesses"][u]["name"],
# user_id: User.all.select{|u| u.owner? == true}.sample.id, 
# image_url: json2["businesses"][u]["image_url"], 
# url: json2["businesses"][u]["url"], 
# review_count: json2["businesses"][u]["review_count"],
# rating: json2["businesses"][u]["rating"],
# latitude: Geocoder.search(json2["businesses"][u]["location"]["display_address"][0]).first.coordinates[0],
# longitude: Geocoder.search(json2["businesses"][u]["location"]["display_address"][0]).first.coordinates[1],
# price: json2["businesses"][u]["price"],
# address: json2["businesses"][u]["location"]["display_address"])
# u +=  1
# end 
# #######################three####################################
# url3 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=3&limit=20"
# response3 = RestClient.get(url3, headers={Authorization: "Bearer "})
# json3 = JSON.parse(response3)
# a = 0
# while a < 20 do 
# Truck.create(
# name: json3["businesses"][a]["name"],
# user_id: User.all.select{|u| u.owner? == true}.sample.id, 
# image_url: json3["businesses"][a]["image_url"], 
# url: json3["businesses"][a]["url"], 
# review_count: json3["businesses"][a]["review_count"],
# rating: json3["businesses"][a]["rating"],
# latitude: Geocoder.search(json3["businesses"][a]["location"]["display_address"][0]).first.coordinates[0],
# longitude: Geocoder.search(json3["businesses"][a]["location"]["display_address"][0]).first.coordinates[1], 
# price: json3["businesses"][a]["price"],
# address: json3["businesses"][a]["location"]["display_address"])
# a +=  1
# end 
# # #######################four####################################
# url4 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=4&limit=20"
# response4 = RestClient.get(url4, headers={Authorization: "Bearer "})
# json4 = JSON.parse(response4)
# b = 0
# while b < 20 do 
# Truck.create(
# name: json4["businesses"][b]["name"],
# user_id: User.all.select{|u| u.owner? == true}.sample.id, 
# image_url: json4["businesses"][b]["image_url"], 
# url: json4["businesses"][b]["url"], 
# review_count: json4["businesses"][b]["review_count"],
# rating: json4["businesses"][b]["rating"],
# latitude: Geocoder.search(json4["businesses"][b]["location"]["display_address"][0]).first.coordinates[0],
# longitude: Geocoder.search(json4["businesses"][b]["location"]["display_address"][0]).first.coordinates[1], 
# price: json4["businesses"][b]["price"],
# address: json4["businesses"][b]["location"]["display_address"])
# b +=  1
# end 
# # #######################five####################################
# url5 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=5&limit=20"
# response5 = RestClient.get(url5, headers={Authorization: "Bearer "})
# json5 = JSON.parse(response3)
# c = 0
# while c < 20 do 
# Truck.create(
# name: json5["businesses"][c]["name"],
# user_id: User.all.select{|u| u.owner? == true}.sample.id, 
# image_url: json5["businesses"][c]["image_url"], 
# url: json5["businesses"][c]["url"], 
# review_count: json5["businesses"][c]["review_count"],
# rating: json5["businesses"][c]["rating"],
# latitude: Geocoder.search(json5["businesses"][c]["location"]["display_address"][0]).first.coordinates[0],
# longitude: Geocoder.search(json5["businesses"][c]["location"]["display_address"][0]).first.coordinates[1], 
# price: json5["businesses"][c]["price"],
# address: json5["businesses"][c]["location"]["display_address"])
# c +=  1
# end 
# # #######################six####################################
# url6 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=6&limit=20"
# response6 = RestClient.get(url6, headers={Authorization: "Bearer "})
# json6 = JSON.parse(response6)
# d = 0
# while d < 20 do 
# Truck.create(
# name: json6["businesses"][d]["name"],
# user_id: User.all.select{|u| u.owner? == true}.sample.id, 
# image_url: json6["businesses"][d]["image_url"], 
# url: json6["businesses"][d]["url"], 
# review_count: json6["businesses"][d]["review_count"],
# rating: json6["businesses"][d]["rating"],
# latitude: Geocoder.search(json6["businesses"][d]["location"]["display_address"][0]).first.coordinates[0],
# longitude: Geocoder.search(json6["businesses"][d]["location"]["display_address"][0]).first.coordinates[1], 
# price: json6["businesses"][d]["price"],
# address: json6["businesses"][d]["location"]["display_address"])
# d +=  1
# end 

# 40.times do 
# Favorite.create!(
#     favoriter_id: User.all.sample.id,
#     favorited_id: Truck.all.sample.id)
# end    

# 40.times do 
#     Rating.create!(
#         rater_id: User.all.sample.id,
#         rated_id: Truck.all.sample.id,
#         score: Faker::Number.within(range: 0..6))
# end    
# 40.times do 
#     Order.create!(
#         user_id: User.all.sample.id,
#         truck_id: Truck.all.sample.id)
# end   
# 40.times do 
#     Review.create!(
#         reviewer_id: User.all.sample.id,
#         reviewed_id: Truck.all.sample.id,
#         content: Faker::Lorem.sentence,
#         username: User.all.sample.username)
# end  

  
# @JesseCustomer = User.create!(
#     firstName: "Jesse",   
#     lastName: "Berman", 
#     username: "Jberma23",
#     role: 0,
#     email: "Jesse.ben.berman@gmail.com",
#     password: "April2597"
#     )
# @JesseOwner = User.create!(
#     firstName: "Jesse",   
#     lastName: "Berman", 
#     username: "Jberma23",
#     role: 1,
#     email: "Bermankid25101@gmail.com",
#     password: "April2597"
#     )
# url7 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=7&limit=20"
# response1 = RestClient.get(url7, headers={Authorization: "Bearer "})
# json7 = JSON.parse(response1)
# # binding.pry
# z = 0 
# while z < 20 do 
# Truck.create(
# name: json1["businesses"][z]["name"],
# user_id: @JesseOwner.id, 
# image_url: json1["businesses"][z]["image_url"], 
# url: json1["businesses"][z]["url"], 
# review_count: json1["businesses"][z]["review_count"],
# rating: json1["businesses"][z]["rating"],
# latitude: Geocoder.search(json7["businesses"][z]["location"]["display_address"][0]).first.coordinates[0],
# longitude: Geocoder.search(json7["businesses"][z]["location"]["display_address"][0]).first.coordinates[1], 
# price: json1["businesses"][z]["price"],
# address: json1["businesses"][z]["location"]["display_address"])
# z +=  1
# end 
# 10.times do 
#     Favorite.create!(
#         favoriter_id: @JesseCustomer.id,
#         favorited_id: Truck.all.sample.id)
#     Rating.create!(
#         rater_id: @JesseCustomer.id,
#         rated_id: Truck.all.sample.id,
#         score: Faker::Number.within(range: 0..6)
#     )
#     Order.create!(
#         user_id: @JesseCustomer.id,
#         truck_id: Truck.all.sample.id)
#     Review.create!(
#         reviewer_id: @JesseCustomer.id,
#         reviewed_id: Truck.all.sample.id,
#         content: Faker::Lorem.sentence, 
#         username: Truck.all.sample.id)
# end    