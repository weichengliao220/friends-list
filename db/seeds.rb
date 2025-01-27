# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Friend.destroy_all
User.destroy_all

user = User.create!(
  email: "user@example.com",
  password: "password",
)

friends_data = [
  { first_name: "Brian", last_name: "Liao", email: "brian@email.com", phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, user: user },
  { first_name: "Rachel", last_name: "Green", email: "rachel_green@email.com", phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, user: user },
  { first_name: "Monica", last_name: "Geller", email: "monica_geller@email.com", phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, user: user },
  { first_name: "Phoebe", last_name: "Buffay", email: "phoebe_buffay@email.com", phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, user: user },
  { first_name: "Joey", last_name: "Tribbiani", email: "joey_tribbiani@email.com", phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, user: user },
  { first_name: "Chandler", last_name: "Bing", email: "chandler_bing@email.com", phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, user: user },
  { first_name: "Ross", last_name: "Geller", email: "ross_geller@email.com", phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, user: user },
  { first_name: "Elon", last_name: "Musk", email: "elon_musk@email.com", phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, user: user },
  { first_name: "Steve", last_name: "Jobs", email: "steve_jobs@email.com", phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, user: user },
  { first_name: "Jeff", last_name: "Bezos", email: "jeff_bezos@email.com", phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, user: user }
]

friends_data.each do |friend_data|
  Friend.create!(friend_data)
end

30.times do
  Friend.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    user: user
  )
end

puts "Created #{Friend.count} friends"
