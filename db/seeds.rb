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

studioA = Studio.create(name: studio_names[0], description: studio_descriptions[0], address: studio_addresses[0], telephone: studio_phone_numbers[0])
studioB = Studio.create(name: studio_names[1], description: studio_descriptions[1], address: studio_addresses[1], telephone: studio_phone_numbers[1])
studioC = Studio.create(name: studio_names[2], description: studio_descriptions[2], address: studio_addresses[2], telephone: studio_phone_numbers[2])
studioD = Studio.create(name: studio_names[3], description: studio_descriptions[3], address: studio_addresses[3], telephone: studio_phone_numbers[3])
studioE = Studio.create(name: studio_names[4], description: studio_descriptions[4], address: studio_addresses[4], telephone: studio_phone_numbers[4])
studioF = Studio.create(name: studio_names[5], description: studio_descriptions[5], address: studio_addresses[5], telephone: studio_phone_numbers[5])
studioG = Studio.create(name: studio_names[6], description: studio_descriptions[6], address: studio_addresses[6], telephone: studio_phone_numbers[6])
studioH = Studio.create(name: studio_names[7], description: studio_descriptions[7], address: studio_addresses[7], telephone: studio_phone_numbers[7])
studioI = Studio.create(name: studio_names[8], description: studio_descriptions[8], address: studio_addresses[8], telephone: studio_phone_numbers[8])
studioJ = Studio.create(name: studio_names[9], description: studio_descriptions[9], address: studio_addresses[9], telephone: studio_phone_numbers[9])

# Seed Users that DON'T belong to studios (regular customers)
puts "Created 20 Users"

user_emails = [
  "kris@wagon.com", "maren@wagon.com", "sey@wagon.com", "nhung@wagon.com",
  "alvaro@wagon.com", "meow@wagon.com", "boris@wagon.com", "test@wagon.com",
  "random@wagon.com", "woof@wagon.com", "pixel@wagon.com", "ajax@wagon.com",
  "stuff@wagon.com", "beer@wagon.com", "frontend@wagon.com", "fullstack@wagon.com",
  "backend@wagon.com", "bleh@wagon.com", "info@fit-flex.de", "hi@fitflex.com"
]

customerA = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[0], password: '123456', password_confirmation: '123456')
customerB = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[1], password: '123456', password_confirmation: '123456')
customerC = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[2], password: '123456', password_confirmation: '123456')
customerD = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[3], password: '123456', password_confirmation: '123456')
customerE = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[4], password: '123456', password_confirmation: '123456')
customerF = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[5], password: '123456', password_confirmation: '123456')
customerG = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[6], password: '123456', password_confirmation: '123456')
customerH = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[7], password: '123456', password_confirmation: '123456')
customerI = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[8], password: '123456', password_confirmation: '123456')
customerJ = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[9], password: '123456', password_confirmation: '123456')
customerK = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[10], password: '123456', password_confirmation: '123456')
# Some users without names
customerL = User.create(email: user_emails[11], password: '123456', password_confirmation: '123456')
customerM = User.create(email: user_emails[12], password: '123456', password_confirmation: '123456')
customerN = User.create(email: user_emails[13], password: '123456', password_confirmation: '123456')
customerO = User.create(email: user_emails[14], password: '123456', password_confirmation: '123456')
customerP = User.create(email: user_emails[15], password: '123456', password_confirmation: '123456')
# Some users belong to studio
customerQ = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[16], password: '123456', password_confirmation: '123456')
customerQ.studio = studioA
customerQ.save
customerR = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[17], password: '123456', password_confirmation: '123456')
customerR.studio = studioA
customerR.save
customerS = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[18], password: '123456', password_confirmation: '123456')
customerS.studio = studioA
customerS.save
customerT = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: user_emails[19], password: '123456', password_confirmation: '123456')
customerT.studio = studioA
customerT.save

puts "Created 26 Courses. To get correct course dates, make sure to seed before demo"
course_titles = [
  "Yoga with Alvaro", "Learn Pole Dancing", "Crossfit for life", "Zumba", 
  "Creative Pilates", "Kickboxing just for you", "Taekwondo", "Hotty hot hot Iron" 
]

course_categories = ["Yoga", "Dance", "Crossfit", "Pilates", "Kickboxing", "Martial Arts", "HOT"]
course_levels = ["Beginner", "Intermediate", "Advanced"]
t = Time.now.beginning_of_day

# Trying my best to match course title and category
# courses today
courseA = Course.new(title: course_titles[0], category: course_categories[0], start_time: t + 13.hours, end_time: t + 14.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseA.studio = Studio.all.sample
courseA.save
courseB = Course.new(title: course_titles[2], category: course_categories[2], start_time: t + 16.hours, end_time: t + 17.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseB.studio = Studio.all.sample
courseB.save
courseC = Course.new(title: course_titles[6], category: course_categories[5], start_time: t + 10.5.hours, end_time: t + 11.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseC.studio = Studio.all.sample
courseC.save
courseD = Course.new(title: course_titles[1], category: course_categories[1], start_time: t + 13.5.hours, end_time: t + 15.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseD.studio = Studio.all.sample
courseD.save
courseE = Course.new(title: course_titles[3], category: course_categories[1], start_time: t + 22.hours, end_time: t + 23.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseE.studio = Studio.all.sample
courseE.save
# courses tomorrow
courseF = Course.new(title: course_titles[0], category: course_categories[0], start_time: t + 1.day + 10.5.hours, end_time: t + 1.day + 11.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseF.studio = Studio.all.sample
courseF.save
courseG = Course.new(title: course_titles[0], category: course_categories[0], start_time: t + 1.day + 9.5.hours, end_time: t + 1.day + 10.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseG.studio = Studio.all.sample
courseG.save
courseH = Course.new(title: course_titles[0], category: course_categories[0], start_time: t + 1.day + 12.hours, end_time: t + 1.day + 13.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseH.studio = Studio.all.sample
courseH.save
courseI = Course.new(title: course_titles[1], category: course_categories[1], start_time: t + 1.day + 12.5.hours, end_time: t + 1.day + 13.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseI.studio = Studio.all.sample
courseI.save
courseJ = Course.new(title: course_titles[1], category: course_categories[1], start_time: t + 1.day + 13.hours, end_time: t + 1.day + 14.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseJ.studio = Studio.all.sample
courseJ.save
courseK = Course.new(title: course_titles[1], category: course_categories[1], start_time: t + 1.day + 14.hours, end_time: t + 1.day + 15.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseK.studio = Studio.all.sample
courseK.save
courseL = Course.new(title: course_titles[2], category: course_categories[2], start_time: t + 1.day + 15.hours, end_time: t + 1.day + 16.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseL.studio = Studio.all.sample
courseL.save
courseM = Course.new(title: course_titles[2], category: course_categories[2], start_time: t + 1.day + 15.hours, end_time: t + 1.day + 16.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseM.studio = Studio.all.sample
courseM.save
courseN = Course.new(title: course_titles[5], category: course_categories[4], start_time: t + 1.day + 20.hours, end_time: t + 1.day + 21.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseN.studio = Studio.all.sample
courseN.save
courseO = Course.new(title: course_titles[3], category: course_categories[1], start_time: t + 1.day + 19.hours, end_time: t + 1.day + 20.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseO.studio = Studio.all.sample
courseO.save
courseP = Course.new(title: course_titles[3], category: course_categories[1], start_time: t + 1.day + 19.5.hours, end_time: t + 1.day + 20.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseP.studio = Studio.all.sample
courseP.save
courseQ = Course.new(title: course_titles[5], category: course_categories[4], start_time: t + 1.day + 8.hours, end_time: t + 1.day + 9.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseQ.studio = Studio.all.sample
courseQ.save
courseR = Course.new(title: course_titles[6], category: course_categories[5], start_time: t + 1.day + 7.hours, end_time: t + 1.day + 8.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseR.studio = Studio.all.sample
courseR.save
courseS = Course.new(title: course_titles[4], category: course_categories[3], start_time: t + 1.day + 7.5.hours, end_time: t + 1.day + 8.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseS.studio = Studio.all.sample
courseS.save
courseT = Course.new(title: course_titles[4], category: course_categories[3], start_time: t + 1.day + 10.5.hours, end_time: t + 1.day + 11.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseT.studio = Studio.all.sample
courseT.save
# courses next 7 days
courseU = Course.new(title: course_titles[5], category: course_categories[4], start_time: t + 2.day + 10.5.hours, end_time: t + 2.day + 11.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseU.studio = Studio.all.sample
courseU.save
courseV = Course.new(title: course_titles[3], category: course_categories[1], start_time: t + 3.day + 14.hours, end_time: t + 3.day + 15.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseV.studio = Studio.all.sample
courseV.save
courseW = Course.new(title: course_titles[2], category: course_categories[2], start_time: t + 4.day + 15.hours, end_time: t + 4.day + 16.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseW.studio = Studio.all.sample
courseW.save
courseX = Course.new(title: course_titles[6], category: course_categories[5], start_time: t + 5.day + 13.hours, end_time: t + 5.day + 14.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseX.studio = Studio.all.sample
courseX.save
courseY = Course.new(title: course_titles[1], category: course_categories[1], start_time: t + 2.day + 20.hours, end_time: t + 2.day + 21.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseY.studio = Studio.all.sample
courseY.save
courseZ = Course.new(title: course_titles[0], category: course_categories[0], start_time: t + 3.day + 10.5.hours, end_time: t + 3.day + 11.5.hours, cost: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: Faker::Lorem.paragraph(1), level: course_levels.sample)
courseZ.studio = Studio.all.sample
courseZ.save

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