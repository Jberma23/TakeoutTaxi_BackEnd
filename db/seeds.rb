require 'rest-client'
require 'json'
require 'pry'
require 'faker'
require 'geocoder'
require 'byebug'
# Truck.connection.execute('ALTER SEQUENCE trucks_id_seq RESTART WITH 1')
# User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
# Review.connection.execute('ALTER SEQUENCE reviews_id_seq RESTART WITH 1')
# Rating.connection.execute('ALTER SEQUENCE ratings_id_seq RESTART WITH 1')
# Favorite.connection.execute('ALTER SEQUENCE favorites_id_seq RESTART WITH 1')
# Update.connection.execute('ALTER SEQUENCE updates_id_seq RESTART WITH 1')
# Order.connection.execute('ALTER SEQUENCE orders_id_seq RESTART WITH 1')
# Truck.delete_all
# User.delete_all
# Review.delete_all
# Rating.delete_all
# Favorite.delete_all
# Update.delete_all
# Order.delete_all
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



60.times do 

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
@JESSEOWNER = User.create(
    firstName: "Jesse",   
    lastName: "Berman", 
    username: "Jberma23",
    role: 1,
    email: "Bermankid25101@gmail.com",
    password: "April2597"
    )
 

STATES = ["WestVirginia", "Minnesota", "Tennessee", "Maryland", "Connecticut", "NorthDakota", "Oregon", "Oklahoma", "Montana", "Nebraska", "Missouri", "RhodeIsland", "NewYork", "Kansas", "NewJersey", "Washington", "California", "NewHampshire", "Georgia", "North Carolina", "Illinois", "Colorado", "Vermont", "Nevada", "Iowa", "Delaware", "SouthCarolina", "Mississippi", "Wyoming", "Louisiana", "Kentucky", "Alabama", "Arizona", "Texas", "Michigan", "Alaska", "Ohio", "Pennsylvania", "Hawaii", "Massachusetts", "Wisconsin", "Utah", "South Dakota", "Indiana", "New Mexico", "Virginia", "Florida", "Idaho", "Maine", "Arkansas", "Washingtondc"]




######################two####################################
num = 0
50.times do 
    state = STATES.sample
    url2 = "https://api.yelp.com/v3/businesses/search?term=FoodTrucks&location=#{state}&limit=50"
    response2 = RestClient.get(url2, headers={Authorization: "Bearer #{Rails.application.credentials[:yelp][:api_key]}"})
    # ENV["YELP_API_KEY"]
    # Rails.application.credentials[:yelp][:api_key]
    json2 = JSON.parse(response2)
    if state == "Washingtondc" 
(0...json2["businesses"].length).each do |number|
truck = Truck.create(
name: json2["businesses"][number]["name"],
owner_id: User.all.sample.id, 
image_url: json2["businesses"][number]["image_url"], 
url: json2["businesses"][number]["url"], 
review_count: json2["businesses"][number]["review_count"],
rating: json2["businesses"][number]["rating"],
latitude: json2["businesses"][number]["coordinates"]["latitude"],
longitude: json2["businesses"][number]["coordinates"]["longitude"], 
price: json2["businesses"][number]["price"],
address: json2["businesses"][number]["location"]["display_address"])
end
else 
url2 = "https://api.yelp.com/v3/businesses/search?term=FoodTrucks&location=#{state}&limit=50"
response2 = RestClient.get(url2, headers={Authorization: "Bearer #{Rails.application.credentials[:yelp][:api_key]}"}) 
# ENV["YELP_API_KEY"]
# Rails.application.credentials[:yelp][:api_key]
json2 = JSON.parse(response2)
(0...json2["businesses"].length).each do |number|
Truck.create(
name: json2["businesses"][number]["name"],
owner_id: User.all.sample.id, 
image_url: json2["businesses"][number]["image_url"], 
url: json2["businesses"][number]["url"], 
review_count: json2["businesses"][number]["review_count"],
rating: json2["businesses"][number]["rating"],
latitude: json2["businesses"][number]["coordinates"]["latitude"],
longitude: json2["businesses"][number]["coordinates"]["longitude"], 
price: json2["businesses"][number]["price"],
address: json2["businesses"][number]["location"]["display_address"])


end
end
end











10.times do 
    # @JesseCustomer = User.find_by(id: 21)
    Favorite.create(
        favoriter_id: @JesseCustomer.id,
        favorited_id: Truck.all.sample.id)
    Rating.create(
        rater_id: @JesseCustomer.id,
        rated_id: Truck.all.sample.id,
        score: Faker::Number.within(range: 0..6)
    )
    Order.create(
        purchaser_id: @JesseCustomer.id,
        seller_id: Truck.all.sample.id)
    Review.create(
        reviewer_id: @JesseCustomer.id,
        reviewed_id: Truck.all.sample.id,
        content: Faker::Lorem.sentence, 
        username: Truck.all.sample.id)
end    


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
        purchaser_id: User.all.sample.id,
        seller_id: Truck.all.sample.id)
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


Menu.create!(name: Faker::Restaurant.type, truck_id: Truck.all.sample.id)
Menu.create!(name: Faker::Restaurant.type, truck_id: Truck.all.sample.id)

Category.create!(name: Faker::Restaurant.type, menu_id: Menu.all.sample.id)
Category.create!(name: Faker::Restaurant.type, menu_id: Menu.all.sample.id)

Item.create!(name: Faker::Food.dish, description: Faker::Food.description, ingredients: "#{Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient + Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient}", price: Faker::Number.between(from: 1, to: 15), category_id: Category.all.sample.id)
Item.create!(name: Faker::Food.dish, description: Faker::Food.description,ingredients: "#{Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient + Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient}", price: Faker::Number.between(from: 1, to: 15), category_id: Category.all.sample.id)
Item.create!(name: Faker::Food.dish, description: Faker::Food.description,ingredients: "#{Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient + Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient}", price: Faker::Number.between(from: 1, to: 15), category_id: Category.all.sample.id)
Item.create!(name: Faker::Food.dish, description: Faker::Food.description,ingredients: "#{Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient + Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient}", price: Faker::Number.between(from: 1, to: 15), category_id: Category.all.sample.id)
Item.create!(name: Faker::Food.dish, description: Faker::Food.description,ingredients: "#{Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient + Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient}", price: Faker::Number.between(from: 1, to: 15), category_id: Category.all.sample.id)
Item.create!(name: Faker::Food.dish, description: Faker::Food.description,ingredients: "#{Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient + Faker::Food.ingredient + ", " + Faker::Food.ingredient + ", " + Faker::Food.ingredient}", price: Faker::Number.between(from: 1, to: 15), category_id: Category.all.sample.id)


Order.create!(seller_id: Truck.all.sample.id, purchaser_id: User.all.sample.id)
Order.create!(seller_id: Truck.all.sample.id, purchaser_id: User.all.sample.id)
Order.create!(seller_id: Truck.all.sample.id, purchaser_id: User.all.sample.id)
Order.create!(seller_id: Truck.all.sample.id, purchaser_id: User.all.sample.id)
Order.create!(seller_id: Truck.all.sample.id, purchaser_id: User.all.sample.id)
# OrderItem.create!(order_id: , item_id: )
# OrderItem.create!(order_id: , item_id: )

