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

puts 'Creating events and tickets...'
event = Event.create(title: 'Demoday Le Wagon', location: 'Rua Mourato Coelho 1440', category: 'Meetup', start_time: Time.new(2019, 12, 7, 20))

ticket = Ticket.new(price: 2000, seat: '5A', area: 'vip')
ticket.event = event
ticket.user = User.create(name: 'João', email: 'juca@gmail.com')
ticket.save!

puts 'Done!'
