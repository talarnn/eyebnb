# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy all users"
User.destroy_all
Profile.destroy_all
puts "Destroy all pairs"
Pair.destroy_all

puts "Creating 10 fakes users with theirs pairs"
10.times do
  user = User.new(email: Faker::Internet.email, password: Faker::Company.name)
  user.save!
  profile = Profile.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    tel: rand(10..99),
    user: user,
    profile_pic:'image/upload/v1551276958/gfpgnejglh2kvvzer0p2.jpg'
  )
  profile.save!
  rand(1..10).times do
    pair = Pair.new(
      title: "#{Faker::FunnyName.name} #{rand(1..9999)}",
      brand: Faker::App.name,
      description: Faker::Games::Fallout.quote,
      right_eye_correction: rand(0..10),
      left_eye_correction: rand(0..10),
      correction_type: ["Presbyopia", "Short sightedness", "Astigmatic", "Farsightedness"].sample,
      price: rand(10..100),
      profile:profile
    )
    puts pair.picture
    pair.save!
  end
end

puts "Creating 5 bookings"
5.times do
  booking = Booking.new(beginning_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), status: ["waiting", "confirmed"].sample)
  booking.pair = Pair.find(rand(Pair.first.id..Pair.last.id))
  booking.profile = Profile.find(rand(Profile.first.id..Profile.last.id))
  booking.save!
end

