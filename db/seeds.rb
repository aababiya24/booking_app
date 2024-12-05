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
# Remove all bookings
Booking.destroy_all

# Remove all users
User.destroy_all

# Create random users
10.times do

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

  User.create!(
    email: "#{first_name.downcase}@gmail.com", # Use the first name for the email
    password: "password",
    first_name: first_name,
    last_name: last_name,
    role: ["client", "photographer"].sample
  )
end

# Create random bookings
20.times do
  Booking.create!(
    user: User.where(role: "client").sample,
    photographer: User.where(role: "photographer").sample,
    date: Faker::Time.forward(days: 10, period: :day),
    message: Faker::Lorem.sentence
  )
end