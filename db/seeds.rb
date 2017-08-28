require 'faker'

puts "Starts seeding.."

# First clear database 
Studio.destroy_all
User.destroy_all

# Seed Studios
studio_names = [
  "Bodystreet", "Fitbox", "Urban Gladiator", "Medical Fitness Academy", 
  "McFit", "Ladyline Loft", "Westhaften Studios", "Nautilus Fitnesscenter", 
  "Zumba Fitness Berlin Tempelhof", "Fitco Fitness"]
studio_descriptions = Faker::Lorem.paragraphs(10)
studio_addresses = [
  "Charlottenstr. 79, 10117 Berlin", "Rudi-Dutschke-Straße 1, 10969 Berlin",
  "Wilhelmstraße 14, 10963 Berlin", "Kleiststraße 3-6, 10787 Berlin",
  "Tauentzienstraße 8, 10789 Berlin", "Stromstraße 39, 10551 Berlin",
  "Turmstraße 57, 10551 Berlin", "Manteuffelstraße 65, 12103 Berlin",
  "Viktoriastraße 10-18, 12105 Berlin", "Herzbergstraße 87-89, 10365 Berlin"]
studio_phone_numbers = [
  "030 33846280", "030 98322747", "0176 55131262", "030 21913071", "030 25794520",
  "030 77906990", "030 3959521", "030 75702377", "0176 84016146", "030 55263303"]

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
# customerA = User.create
# Some users without names








puts "Seeding complete"