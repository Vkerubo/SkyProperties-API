require 'faker'

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

# Create properties
80.times do
  Property.create!(
    title: Faker::Lorem.sentence,
    address: Faker::Address.full_address,
    price: Faker::Number.between(from: 100000, to: 1000000),
    image: Faker::LoremFlickr.image(size: "300x200"),
    bedrooms: Faker::Number.between(from: 1, to: 5),
    bathrooms: Faker::Number.between(from: 1, to: 3),
    seller_id: Seller.pluck(:id).sample
  )
end

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
