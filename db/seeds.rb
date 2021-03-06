puts "Destroy all users"
User.destroy_all
Profile.destroy_all
puts "Destroy all pairs"
Pair.destroy_all

puts "Creating 1 fakes users with theirs pairs"
1.times do
  usera = User.new(email: "pugmaster@hotmail.com", password: "aaaaaa")
  usera.save!
  profilea = Profile.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    tel: rand(10..99),
    user: usera,
    remote_profile_pic_url:'https://picsum.photos/300/300?image=1062'
  )
  profilea.save!
  user = User.new(email: "bookmaster@hotmail.com", password: "aaaaaa")
  user.save!
  profile = Profile.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    tel: rand(10..99),
    user: user,
    remote_profile_pic_url:'https://picsum.photos/300/300?image=1062'
  )
  profile.save!
  20.times do
    pair = Pair.new(
      title: "#{Faker::Beer.brand} #{rand(1..9999)}",
      brand: Faker::App.name,
      right_eye_correction: rand(0..10),
      left_eye_correction: rand(0..10),
      correction_type: ["Presbyopia", "Short sightedness", "Astigmatic", "Farsightedness"].sample,
      price: rand(10..100),
      profile:profilea,
      remote_picture_url:'https://cdn.trendhunterstatic.com/thumbs/ksubi-eyewear-sigma.jpeg'
    )
    pair.save!
    puts "creating bookings"
    booking = Booking.new(
      beginning_date: 'Sat 02 Mar 2019',
      end_date: 'Tue 05 Mar 2019',
      pair:pair,
      profile:profile,
      status: rand(1...4)
    )
    booking.save!
    print '#'
  end
end



#puts "Creating 5 bookings"
#5.times do
#  booking = Booking.new(beginning_date: Faker::Date.backward(14), end_date: Faker::Date.forward(23), status: ["waiting", "confirmed"].sample)
#  booking.pair = Pair.find(rand(Pair.first.id..Pair.last.id))
#  booking.profile = Profile.find(rand(Profile.first.id..Profile.last.id))
#  booking.save!
#end

