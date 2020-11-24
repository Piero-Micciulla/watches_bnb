require 'faker'
require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Watch.destroy_all
User.destroy_all
puts 'Creating 10 users...'
10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name::last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    )
end
puts "Created #{User.count} users"

User.all.each do |user|
  3.times do
    watch = Watch.create(
      brand: Faker::FunnyName.two_word_name,
      price: rand(9000..50000),
      description: Faker::Restaurant.description,
      user: user
      )
    file = URI.open('https://source.unsplash.com/1600x900/?watch')
    watch.photos.attach(io: file, filename: "#{watch.brand}.jpg", content_type: 'image/jpg')
  end
  puts "Created #{Watch.count} watches"
end
