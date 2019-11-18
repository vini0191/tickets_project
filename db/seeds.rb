# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying events...'
Event.destroy_all

puts 'Destroying tickets...'
Ticket.destroy_all

puts 'Destroying users...'
User.destroy_all

puts 'Creating fake Users...'
20.times do
  User.create!(name: Faker::Name.name,
    email: Faker::Internet.email,
    city: Faker::Address.city,
    password: 'password')
end

puts 'Creating fake Events...'
100.times do
  Event.create!(title: Faker::Name.name,
    location: Faker::Address.street_address,
    category: %w[show theatre party lecture workshop wellness art].sample,
    start_time: Faker::Time.forward(days: 23, period: :evening)
    )
end

puts 'Creating fake tickets...'

300.times do
  ticket = Ticket.new(price: Faker::Number.number(digits: 5),
    seat: %w[3D 8H 27 829 E93 87 801 45 988E A65 F62].sample,
    area: %w[vip field camarote normal half-price backstage].sample)
  ticket.event = Event.find(rand(Event.first.id..Event.last.id))
  ticket.user = User.find(rand(User.first.id..User.last.id))
  ticket.save!
end

puts 'Done!'
