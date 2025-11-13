puts "Generating Restaurants"
puts "beginning now..."

30.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: Restaurant::CATEGORY.sample,
    phone_number: Faker::Number.number(digits: 10)
  )
end

puts "complete"
puts "added #{Restaurant.all.length} restaurants"

puts "generating reviews"
Restaurant.all.each do |restaurant|
  rand(1..3).times do
    restaurant.reviews << Review.create!(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant_id: restaurant.id
    )
  end
end

puts "complete"
puts "added #{Review.all.length} reviews"
