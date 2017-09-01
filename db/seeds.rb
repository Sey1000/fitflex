require 'faker'

puts "Start seeding.."

# First clear database
Review.destroy_all
Booking.destroy_all
Course.destroy_all
User.destroy_all
Studio.destroy_all

# Seed 10 Studios
puts "Created Studios"

studio_hash = {
  "Bodystreet" => { address: "Charlottenstr. 79, 10117 Berlin", telephone: "030 33846280", cld_id: "jnmth8rsvmvcbhi0hokx", distance: 0.2 },
  "Fitbox" => { address: "Rudi-Dutschke-Straße 1, 10969 Berlin", telephone: "030 98322747", cld_id: "hzgzwqyvcjxocjxrty4v", distance: 0.4 },
  "Urban Gladiator" => { address: "Wilhelmstraße 14, 10963 Berlin", telephone: "0176 55131262", cld_id: "sloh6uufvv8tvyqa8jwf", distance: 0.9 },
  "Medical Fitness Academy" => { address: "Kleiststraße 3-6, 10787 Berlin", telephone: "030 21913071", cld_id: "gg69jatbm9zaegcdzafb", distance: 4.0 },
  "McFit" => { address: "Tauentzienstraße 8, 10789 Berlin", telephone: "030 25794520", cld_id: "tkzjagesfqt24rzkp1ib", distance: 4.5 },
  "Ladyline Loft" => { address: "Stromstraße 39, 10551 Berlin", telephone: "030 77906990", cld_id: "hdspljxylbtwbgcuaxab", distance: 6.1 },
  "Westhaften Studios" => { address: "Turmstraße 57, 10551 Berlin", telephone: "030 3959521", cld_id: "am3jqwown9tkbeshaian", distance: 6.0 },
  "Nautilus Fitnesscenter" => { address: "Manteuffelstraße 65, 12103 Berlin", telephone: "030 75702377", cld_id: "mwughpj2aqebnfheppf9", distance: 5.7 },
  "Zumba Fitness Berlin Tempelhof" => { address: "Viktoriastraße 10-18, 12105 Berlin", telephone: "0176 84016146", cld_id: "blsqctzk1r8h5cw7qrre", distance: 6.4 },
  "Fitco Fitness" => { address: "Herzbergstraße 87-89, 10365 Berlin", telephone: "030 55263303", cld_id: "r5hmmxyb181qrj8efogs", distance: 9.6 }
}

studio_hash.each do |st_name, st_info|
  s = Studio.create(name: st_name, description: Faker::Lorem.paragraph, address: st_info[:address], telephone: st_info[:telephone], cld_id: st_info[:cld_id], distance: st_info[:distance])
end

# Seed Users that DON'T belong to studios (regular customers)
puts "Created Users"

user_emails = [
  "kris@wagon.com", "maren@wagon.com", "sey@wagon.com", "nhung@wagon.com",
  "alvaro@wagon.com", "meow@wagon.com", "boris@wagon.com", "test@wagon.com",
  "random@wagon.com", "woof@wagon.com", "pixel@wagon.com", "ajax@wagon.com",
  "stuff@wagon.com", "beer@wagon.com", "frontend@wagon.com", "fullstack@wagon.com",
  "backend@wagon.com", "bleh@wagon.com", "info@fit-flex.de", "hi@fitflex.com"
]

user_emails[0..10].each do |em|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: em, password: '123456', password_confirmation: '123456')
end

# more users with fake infos
30.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', password_confirmation: '123456')
end

# Some users without names
user_emails[11..15].each do |em|
  User.create(email: em, password: '123456', password_confirmation: '123456')
end

# Some users belong to studio
user_emails[16..19].each do |em|
  u = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: em, password: '123456', password_confirmation: '123456')
  u.studio = Studio.first
  u.save
end

demo_user = User.create(first_name: "Kris", last_name: "Espinosa", email: "demo@wagon.com", password: '123456', password_confirmation: '123456')

puts "Created Courses. To get correct course dates, make sure to seed before demo"
course_hash = {
  "Yoga with Alvaro" => { category: "Yoga", description: "This course is comprised of six series of asana, each of which has a specific function in cleansing and strengthening the mind and body." },
  "Learn Pole Dancing" => { category: "Dance", description: "You will increase your upper body strength and improve your cardio with each move, plus learn the true Diva routine containing 15 new moves." },
  "Crossfit for life" => { category: "Crossfit", description: "Crossfit is appropriate for all populations looking to create a more robust and efficient aerobic system. " },
  "Zumba" => { category: "Dance", description: "Learn how to blend specific Zumba moves and body sculpting techniques using maraca-like Zumba Toning Sticks for an intense strength-training experience." },
  "Creative Pilates" => { category: "Pilates", description: "High-energy and dynamic class which integrates elements of Pilates, Dance, cardio, strength training and stretching. No dance experience required!" },
  "Kickboxing just for you" => { category: "Kickboxing", description: "Come ready to sweat like crazy, build a rock solid core, and burn hundreds of calories." },
  "Taekwondo" => { category: "Martial Arts", description: "Taekwondo emphasizes a sense of morality, humility, and a respect for one's opponent. Practitioners can improve both their physical ability and mental strength." },
  "Interval Training" => { category: "HIIT", description: "HIIT is extremely popular because it provides both strength training and the calorie burning that comes with a cardio workout in intensely short sessions." }
}

course_levels = ["Beginner", "Beginner", "Intermediate", "Intermediate", "Advanced"]
t = Time.now.beginning_of_day
random_today = [t + (8..15).to_a.sample.hour, t + (19..21).to_a.sample.hour]
random_length = [1, 1, 1, 1, 1.5, 1.5, 2]

# today
course_hash.each do |title, info|
  st = random_today.sample
  cour = Course.new(title: title, category: info[:category], start_time: st, end_time: st + random_length.sample.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: info[:description], level: course_levels.sample)
  cour.studio = Studio.all.sample
  cour.save
end

# tomorrow
course_hash.each do |title, info|
  2.times do
    st = random_today.sample + 1.day
    cour = Course.new(title: title, category: info[:category], start_time: st, end_time: st + random_length.sample.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: info[:description], level: course_levels.sample)
    cour.studio = Studio.all.sample
    cour.save
  end
end

# next 7 days
course_hash.each do |title, info|
  st = random_today.sample + (2..7).to_a.sample.day
  cour = Course.new(title: title, category: info[:category], start_time: st, end_time: st + random_length.sample.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: info[:description], level: course_levels.sample)
  cour.studio = Studio.all.sample
  cour.save
end

# old courses
course_hash.each do |title, info|
  st = random_today.sample - (1..7).to_a.sample.day
  cour = Course.new(title: title, category: info[:category], start_time: st, end_time: st + random_length.sample.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: info[:description], level: course_levels.sample)
  cour.studio = Studio.all.sample
  cour.save
end

demo_booking = Booking.new
demo_booking.user = demo_user
demo_booking.course = Course.last
demo_booking.save

puts "Created a bunch of bookings"

User.all.each do |usr|
  (1..7).to_a.sample.times do
    b = Booking.new
    b.user = usr
    b.course = Course.all.sample
    b.save
  end
end

review_titles = [
  ["Too easy for me", "Too difficult", "Okay", "Meh"],
  ["Too easy for me", "Too difficult", "This was great", "Awesome",
    "Would do it again", "Good deal!", "Loved it!!",
    "Please bring this course to Frankfurt"],
  ["Best course ever", "You should definitely do this course!",
      "Perfect intensity, cost, everything!", "Best instructor ever", "This was great",
      "Awesome", "Would do it again", "Good deal!", "Loved it!!",
      "Please bring this course to Frankfurt"]
]

puts "Created reviews"

Course.all.each do |cs|
  (1..5).to_a.sample.times do
    ind = (0..2).to_a.sample
    r = Review.new(title: review_titles[ind].sample, content: Faker::HowIMetYourMother.quote, rating: ind + 3)
    r.course = cs
    r.user = User.all.sample
    r.save
  end
end

# 100.times do
#   ind = (0..2).to_a.sample
#   r = Review.new(title: review_titles[ind].sample, content: Faker::HowIMetYourMother.quote, rating: ind + 3)
#   r.course = Course.all.sample
#   r.user = User.all.sample
#   r.save
# end

puts "Seeding complete"
