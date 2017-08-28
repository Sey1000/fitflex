require 'faker'

puts "Starts seeding.."

# First clear database 
Studio.destroy_all
User.destroy_all

# Seed 10 Studios
puts "Seeding 10 Studios"
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
puts "Seeding 20 Users"

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

puts "Seeding 20 Courses. To get correct course dates, make sure to seed before demo"
course_titles = [
  "Yoga with Alvaro", "Learn Pole Dancing", "Crossfit for life", "Zumba", 
  "Creative Pilates", "Kickboxing just for you", "Taekwondo", "Hotty hot hot Iron" 
]

t = Time.now.beginning_of_day

# courses today
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)
courseA = Course.new(title: course_titles.sample)


puts "Seeding complete"