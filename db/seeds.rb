require 'faker'

puts "Start seeding.."

# First clear database 
Review.destroy_all
Booking.destroy_all
Course.destroy_all
User.destroy_all
Studio.destroy_all

# Seed 10 Studios
puts "Created 10 Studios"
studio_names = [
  "Bodystreet", "Fitbox", "Urban Gladiator", "Medical Fitness Academy", 
  "McFit", "Ladyline Loft", "Westhaften Studios", "Nautilus Fitnesscenter", 
  "Zumba Fitness Berlin Tempelhof", "Fitco Fitness"
]
studio_descriptions = Faker::Lorem.paragraphs(10)
studio_addresses = [
  "Charlottenstr. 79, 10117 Berlin", "Rudi-Dutschke-Straße 1, 10969 Berlin",
  "Wilhelmstraße 14, 10963 Berlin", "Kleiststraße 3-6, 10787 Berlin",
  "Tauentzienstraße 8, 10789 Berlin", "Stromstraße 39, 10551 Berlin",
  "Turmstraße 57, 10551 Berlin", "Manteuffelstraße 65, 12103 Berlin",
  "Viktoriastraße 10-18, 12105 Berlin", "Herzbergstraße 87-89, 10365 Berlin"
]
studio_phone_numbers = [
  "030 33846280", "030 98322747", "0176 55131262", "030 21913071", "030 25794520",
  "030 77906990", "030 3959521", "030 75702377", "0176 84016146", "030 55263303"
]

(0..9).to_a.each do |ind|
  Studio.create(name: studio_names[ind], description: studio_descriptions[ind], address: studio_addresses[ind], telephone: studio_phone_numbers[ind])
end

# Seed Users that DON'T belong to studios (regular customers)
puts "Created 20 Users"

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

# Some users without names
user_emails[11..15].each do |em|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: em, password: '123456', password_confirmation: '123456')
end

# Some users belong to studio
user_emails[16..19].each do |em|
  u = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: em, password: '123456', password_confirmation: '123456')
  u.studio = Studio.first
  u.save
end

puts "Created 26 Courses. To get correct course dates, make sure to seed before demo"
course_hash = {
  "Yoga with Alvaro" => "Yoga", 
  "Lean Pole Dancing" => "Dance", 
  "Crossfit for life" => "Crossfit", 
  "Zumba" => "Dance",
  "Creative Pilates" => "Pilates", 
  "Kickboxing just for you" => "Kickboxing", 
  "Taekwondo" => "Martial Arts",
  "Hotty hot hot Iron" => "HOT"
}

course_levels = ["Beginner", "Beginner", "Intermediate", "Intermediate", "Advanced"]
t = Time.now.beginning_of_day
random_today = [t + (8..15).to_a.sample.hour, t + (19..21).to_a.sample.hour]
random_length = [1, 1, 1, 1, 1.5, 1.5, 2]

# today
course_hash.each do |title, category|
  st = random_today.sample
  cour = Course.new(title: title, category: category, start_time: st, end_time: st + random_length.sample.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
  cour.studio = Studio.all.sample
  cour.save
end

# tomorrow
course_hash.each do |title, category|
  4.times do 
    st = random_today.sample + 1.day
    cour = Course.new(title: title, category: category, start_time: st, end_time: st + random_length.sample.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
    cour.studio = Studio.all.sample
    cour.save
  end
end

# next 7 days
course_hash.each do |title, category|
  2.times do
    st = random_today.sample + (2..7).to_a.sample.day
    cour = Course.new(title: title, category: category, start_time: st, end_time: st + random_length.sample.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
    cour.studio = Studio.all.sample
    cour.save
  end
end

# old courses
course_hash.each do |title, category|
  st = random_today.sample - (1..7).to_a.sample.day
  cour = Course.new(title: title, category: category, start_time: st, end_time: st + random_length.sample.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
  cour.studio = Studio.all.sample
  cour.save
end

puts "Created a bunch of bookings"
Course.all.each do |crs|
  (1..4).to_a.sample.times do
    b = Booking.new
    b.user = User.all.sample
    b.course = crs
    b.save
  end
end

review_titles = [
  ["Too easy for me", "Too difficult", "Okay", "Meh"],
  ["Too easy for me", "Too difficult", "Okay", "Meh"],
  ["Too easy for me", "Too difficult", "This was great", "Awesome", 
    "Would do it again", "Good deal!", "Loved it!!", 
    "Please bring this course to Frankfurt"],
    ["Best course ever", "You should definitely do this course!",
      "Perfect intensity, cost, everything!", "Best instructor ever", "This was great", 
      "Awesome", "Would do it again", "Good deal!", "Loved it!!", 
      "Please bring this course to Frankfurt"]
    ]

    puts "Created 100 reviews"
    100.times do
      ind = (0..3).to_a.sample
      r = Review.new(title: review_titles[ind].sample, content: Faker::HowIMetYourMother.quote, rating: ind + 2)
      r.course = Course.all.sample
      r.user = User.all.sample
      r.save
    end

    puts "Seeding complete"