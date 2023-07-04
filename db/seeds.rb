require 'faker'

puts "start seeding"

# Generate 100 sample properties
100.times do
  # Generate random data for each property
  title = Faker::Address.street_name
  address = Faker::Address.full_address
  price = Faker::Number.number(digits: 6)
  images = [Faker::LoremFlickr.image, Faker::LoremFlickr.image]
  bedrooms = Faker::Number.between(from: 1, to: 5)
  bathrooms = Faker::Number.between(from: 1, to: 4)
  seller_id = Faker::Number.between(from: 1, to: 10)

  # Print the generated data for each property
  puts "Title: #{title}"
  puts "Address: #{address}"
  puts "Price: #{price}"
  puts "Images: #{images}"
  puts "Bedrooms: #{bedrooms}"
  puts "Bathrooms: #{bathrooms}"
  puts "Seller ID: #{seller_id}"
end

puts "done seeding"
