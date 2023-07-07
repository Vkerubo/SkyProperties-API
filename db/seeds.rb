require 'faker'
require 'httparty'


puts "start seeding"

Favorite.delete_all
Buyer.delete_all
Property.delete_all
Seller.delete_all


# Clear existing data
Favorite.delete_all
Buyer.delete_all
Property.delete_all
Seller.delete_all

# Create sellers
20.times do
  name = Faker::Name.name
  email_name = name.downcase.gsub(' ', '')
  Seller.create!(
    name: name,
    email: "#{email_name}@gmail.com",
    phone: "07#{Faker::Number.unique.number(digits: 8)}"
  )
end

# pexels_url = 'https://api.pexels.com/v1/search?query=house'

puts "Creating properties"
pexels_api_key = "aX2JYwcpJsFx1S7COYpSDx3m1GhGEcleolbFM3QXmSnUcCswMOkg9Kil"

80.times do
  query = ['house', 'apartment', 'villa', 'cabin'].sample
  pexels_url = "https://api.pexels.com/v1/search?query=#{query}"

  response = HTTParty.get(pexels_url, headers: { 'Authorization' => pexels_api_key })
  property_image = response['photos'].sample['src']['large']

  Property.create!(
    title: Faker::Address.unique.building_number + ' ' + Faker::Address.street_name,
    address: Faker::Address.full_address,
    price: Faker::Number.between(from: 100000, to: 1000000),
    image: property_image,
    bedrooms: Faker::Number.between(from: 1, to: 5),
    bathrooms: Faker::Number.between(from: 1, to: 3),
    seller_id: Seller.pluck(:id).sample
  )
end
puts "ended creating"


# Create buyers
20.times do
  name = Faker::Name.name
  email_name = name.downcase.gsub(' ', '')
  Buyer.create!(
    name: name,
    email: "#{email_name}@gmail.com",
    phone: "07#{Faker::Number.unique.number(digits: 8)}"
  )
end

# Create favorites
100.times do
  Favorite.create!(
    buyer_id: Buyer.pluck(:id).sample,
    property_id: Property.pluck(:id).sample
  )
end

puts "done seeding"
