require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating 10 users...'
10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name::last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    encrypted_password: Faker::Internet.password,
    )
end
puts "Created 10 users"


puts 'Creating 10 watches...'
10.times do
  watch = Watch.create(
    brand: Faker::FunnyName.two_word_name,
    price: rand(9000..50000),
    user_id: rand(1..10),
    )
end
puts "Created 10 watches"
