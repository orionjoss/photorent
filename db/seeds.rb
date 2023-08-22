require 'faker'

puts "Clearing the database"

Booking.destroy_all
Camera.destroy_all
User.destroy_all

puts "Database cleared"

puts "Created Orion user"
User.create(
  first_name: "Orion",
  last_name: "Joss",
  email: "orion@gmail.com",
  password: "123456")
puts "User created"

puts "Created Jorge user"
User.create(
  first_name: "Jorge",
  last_name: "Teixeira",
  email: "jorge@gmail.com",
  password: "123456")
puts "User created"

puts "Created Hugo user"
  User.create(
    first_name: "Hugo",
    last_name: "Pereira",
    email: "hugo@gmail.com",
    password: "123456")
puts "User created"

puts "Creating camera"
Camera.create(
  camera_type: ["DSLR", "Mirrorless", "Point-and-shoot"].sample,
  brand: ["Canon", "Nikon", "Sony", "Fujifilm"].sample,
  user_id: User.pluck(:id).sample,
  address: Faker::Address.full_address)
puts "Camera created"

puts "Creating booking"
Booking.create(
  start_date: Date.today,
  end_date: Faker::Date.forward(days: 30),
  user_id: User.pluck(:id).sample,
  camera_id: Camera.pluck(:id).sample,
  status: ["Pending", "Confirmed", "Declined"].sample)
puts "Booking created"
