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
Material.destroy_all

 ADDRESSES = [
'Maarten Lutherweg 122, 1185 Amstelveen',
'Charley Tooropgracht 843, 1112 Diemen',
'Hovendaal 91, 9660 Brakel',
'Kerkstraat 273, 1017 Amsterdam',
'Leidseplein 15, 1017  Amsterdam',
'Van Breestraat 69, 1071 Amsterdam',
'Tweede Jan van der Heijdenstraat 2, 1073 Amsterdam',
'Lindengracht 23, 1015 Amsterdam'
'Meeuwenlaan 145, 1021 Amsterdam'
'J.J. Cremerplein 45, 1054 Amsterdam'
 ]

 BRANDS = [
  'Rolex GMT Master',
  'Jeager leCoultre Grand Reverso Duo'
  'Hublot Big Bang'
  'Panerai PAM111 Luminor'
  'Frank Müller Vegas'
  'Tag Heuer Carrera'
  'Omega Constellation'
  'Breitling Navitimer 01'
  'Audemars Piguet Royal Oak Chrono'
  'Cartier Ballon Bleu'
]

DESCRIPTION = [
  "Rolex is a classic staple of any luxury watch collection. The GMT Master
  and the Submariner are some of the most popular watches Rolex sells.
  This is the "'Pepsi'" version. It has a unique blue/red theme to the dial
  and the GMT hand, which helps add a touch of sportiness to the watch.",
  "This is a very unique watch. It actually comes with two sides(a black dial
  and a white dial), all you have to do is flip it and you get to experience
  an all new watch.",
  "A great looking sporty 44mm chronograph that adds a touch of class thanks
  to the rose gold case and accents.",
  "This is a classic Panerai. It's a 44mm watch that really brings attention
  to your wrist. The crown guard really helps tell everyone who looks that
  the watch is special and the sandwich dial is a simple yet classy feature that
  separates it from the other watches on the market today. And like most PAMs,
  it has a very easy strap changing mechanism.",
  "These watches aren't just watches, they are works of art. With the Vegas
  you get the roulette complication on the watch. Just hit the button on the
  crown to make it spin. A perfect distraction for any occasion that will vow
  everyone around.",
  "A stunning chrono with a very easy to read dial in gray. Powered by the
  1887 movement.",
  "A stunning dress watch with a rare white dial/blue markers combo and a
  coin edge dial.",
  "When people think Breitling, this is usually the model they think of.
  A stunning watch that can be used for many tasks.",
  "This AP is a stunning piece. And these are even rarer in the wild than
  the base 15400 versions.",
  "At 44mm this is undoubtfully the men's version of the watch. Just like
  all Cartiers, this is an elegant watch that adds a touch of class to
  your wrist."
]

 MATERIALS = [
  'stainless steel',
  'wood',
  'titanium',
  'ceramics',
  'yellow gold',
  'carbon fiber',
  'rose gold',
  'platinum',
  'scratch-resistant sapphire',
  'acryilic/plexiglass',
  'mineral crystal',
  'bronze',
  'two-tone',
  'white gold'
 ]

# creating materials for watches
 MATERIALS.each do |material|
  Material.create(name: material)
 end


5.times do
Booking.destroy_all
end

puts 'Creating 10 users...'
10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name::last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )

end
admin = User.create(
  first_name: "camille",
  last_name: "schull",
  address: "Le wagon",
  email: "lewagon@wagon.com",
  password: "123456"
  )

puts "Created #{User.count} users"
User.all.each do |user|
  3.times do
    watch = Watch.create(
      brand: Faker::FunnyName.two_word_name,
      price: rand(100..5000),
      description: Faker::Restaurant.description,
      address: ADDRESSES.sample,
      material: Material.all.sample,
      user: user
      )
    file = URI.open('https://source.unsplash.com/1600x900/?watch,men')
    watch.photos.attach(io: file, filename: "#{watch.brand}.jpg", content_type: 'image/jpg')
  end
  puts "Created #{Watch.count} watches"
end


puts "Creating 10 bookings"
10.times do
  x = 0
  Booking.create(
    start_date: Date.today,
    end_date: Date.tomorrow,
    watch_id: (Watch.last.id - x),
    user_id: (User.last.id)
    )
  x += 1
end

puts "Created #{Booking.count} bookings"


