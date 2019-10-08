require 'rest-client'
require 'json'
require 'pry'
require 'faker'
require 'geocoder'

Truck.delete_all
User.delete_all
Review.delete_all
Rating.delete_all
Favorite.delete_all
Update.delete_all
# 100.times do 
# longmin1 = -76.815637;
# longmax1 = -77.216386;
# latmin1 = 38.771353;
# latmax1 = 39.00;
# Location.create(
# longitude: (longmin1 + (rand * (longmax1 - longmin1))),
# latitude: (latmin1 + (rand * (latmax1 - latmin1)))
# )
# end
# 40.times do 
#     longmin2 = -76.972600;
#     longmax2 = 77.216386;
#     latmin2 = 39.070865;
#     latmax2 = 38.725156;
#     Location.create(
#     longitude: (-76.972600 + (rand * (77.216386 + 76.972600)))
#     latitude:  (39.070865 + (rand * (38.725156 - 39.070865)))
#     )
#     end



20.times do 

User.create(
firstName: Faker::Name.unique.first_name,   
lastName: Faker::Name.unique.last_name, 
username: Faker::Internet.username(specifier: @firstName),
role: Faker::Number.within(range: 0..1),
email: Faker::Internet.email(name: @firstName),
password: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
)
end
@JesseCustomer = User.create(
    firstName: "Jesse",   
    lastName: "Berman", 
    username: "Jberma23",
    role: 0,
    email: "Jesse.ben.berman@gmail.com",
    password: "April2597"
    )
@JesseOwner = User.create(
    firstName: "Jesse",   
    lastName: "Berman", 
    username: "Jberma23",
    role: 1,
    email: "Bermankid25101@gmail.com",
    password: "April2597"
    )
 
######################one####################################
url1 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc"
response1 = RestClient.get(url1, headers={Authorization: "Bearer #{ENV["YELP_API_KEY"]}"})

json1 = JSON.parse(response1)
json1["businesses"].each do |key,value|
Truck.create(
name: key["name"],
user_id: @JesseOwner.id, 
image_url: key["image_url"], 
url: key["url"], 
review_count: key["review_count"],
rating: key["rating"],
latitude: key["coordinates"]["latitude"],
longitude: key["coordinates"]["longitude"], 
price: key["price"],
address: key["location"]["display_address"])
end 


# ######################two####################################
url2 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=Virginia"
response2 = RestClient.get(url1, headers={Authorization: "Bearer #{ENV["YELP_API_KEY"]}"})

json2 = JSON.parse(response2)
json2["businesses"].each do |key,value|
Truck.create(
name: key["name"],
user_id: User.all.sample.id, 
image_url: key["image_url"], 
url: key["url"], 
review_count: key["review_count"],
rating: key["rating"],
latitude: key["coordinates"]["latitude"],
longitude: key["coordinates"]["longitude"], 
price: key["price"],
address: key["location"]["display_address"])
end 
# #######################three####################################
url3 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=Maryland"
response3 = RestClient.get(url3, headers={Authorization: "Bearer #{ENV["YELP_API_KEY"]}"})

json3 = JSON.parse(response3)
json3["businesses"].each do |key,value|
Truck.create(
name: key["name"],
user_id: User.all.sample.id, 
image_url: key["image_url"], 
url: key["url"], 
review_count: key["review_count"],
rating: key["rating"],
latitude: key["coordinates"]["latitude"],
longitude: key["coordinates"]["longitude"], 
price: key["price"],
address: key["location"]["display_address"])
end
# # #######################four####################################
i = 0
while i < 30 do 
url = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=#{Faker::Address.state}"
stuff = RestClient.get(url,headers={Authorization: "Bearer #{ENV["YELP_API_KEY"]}"})
    JSON.parse(stuff)["businesses"].each do |key,value|
Truck.create(
name: key["name"],
user_id: User.all.sample.id, 
image_url: key["image_url"], 
url: key["url"], 
review_count: key["review_count"],
rating: key["rating"],
latitude: key["coordinates"]["latitude"],
longitude: key["coordinates"]["longitude"], 
price: key["price"],
address: key["location"]["display_address"])
end
i += 1
end


10.times do 
    Favorite.create(
        favoriter_id: @JesseCustomer.id,
        favorited_id: Truck.all.sample.id)
    Rating.create(
        rater_id: @JesseCustomer.id,
        rated_id: Truck.all.sample.id,
        score: Faker::Number.within(range: 0..6)
    )
    Order.create(
        user_id: @JesseCustomer.id,
        truck_id: Truck.all.sample.id)
    Review.create(
        reviewer_id: @JesseCustomer.id,
        reviewed_id: Truck.all.sample.id,
        content: Faker::Lorem.sentence, 
        username: Truck.all.sample.id)
end    
# #######################five####################################
# url5 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=5&limit=20"
# response5 = RestClient.get(url5, headers={Authorization: "Bearer #{ENV["YELP_API_KEY"]}"})
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
# latitude: key["coordinates"]["latitude"],
# longitude: key["coordinates"]["longitude"], 
# price: json5["businesses"][c]["price"],
# address: json5["businesses"][c]["location"]["display_address"])
# c +=  1
# end 
# # #######################six####################################
# url6 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=6&limit=20"
# response6 = RestClient.get(url6, headers={Authorization: "Bearer #{ENV["YELP_API_KEY"]}"})
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
# latitude: key["coordinates"]["latitude"],
# longitude: key["coordinates"]["longitude"], 
# price: json6["businesses"][d]["price"],
# address: json6["businesses"][d]["location"]["display_address"])
# d +=  1
# end 

40.times do 
Favorite.create(
    favoriter_id: User.all.sample.id,
    favorited_id: Truck.all.sample.id)
end    

40.times do 
    Rating.create(
        rater_id: User.all.sample.id,
        rated_id: Truck.all.sample.id,
        score: Faker::Number.within(range: 0..6))
end    
40.times do 
    Order.create(
        user_id: User.all.sample.id,
        truck_id: Truck.all.sample.id)
end   
40.times do 
    Review.create(
        reviewer_id: User.all.sample.id,
        reviewed_id: Truck.all.sample.id,
        content: Faker::Lorem.sentence,
        username: User.all.sample.username)
end  
10.times do 
    Update.create(
        content: "#{User.all.sample.username} just favored #{Truck.all.sample.name}")
end  
10.times do 
    Update.create(
        content: "#{Truck.all.sample.name} just updated it's location")
end  
10.times do 
    Update.create(
        content: "#{User.all.sample.username} just rated #{Truck.all.sample.name}")
end  
10.times do 
    Update.create(
        content: "#{User.all.sample.username} just reviewed #{Truck.all.sample.name}")
end  

url7 = "https://api.yelp.com/v3/businesses/search?term=foodtruck&location=washingtondc&&page=7&limit=20"
response1 = RestClient.get(url7, headers={Authorization: "Bearer #{ENV["YELP_API_KEY"]}"})
json7 = JSON.parse(response1)
# binding.pry
z = 0 
while z < 20 do 
Truck.create(
name: json1["businesses"][z]["name"],
user_id: @JesseOwner.id, 
image_url: json1["businesses"][z]["image_url"], 
url: json1["businesses"][z]["url"], 
review_count: json1["businesses"][z]["review_count"],
rating: json1["businesses"][z]["rating"],
latitude: json1["coordinates"]["latitude"],
longitude: json1["coordinates"]["longitude"], 
price: json1["businesses"][z]["price"],
address: json1["businesses"][z]["location"]["display_address"])
z +=  1
end 
