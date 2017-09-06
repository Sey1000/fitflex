require 'faker'

puts "Start seeding.."

# First clear database
Instructor.destroy_all
Favorite.destroy_all
Review.destroy_all
Booking.destroy_all
Course.destroy_all
User.destroy_all
Studio.destroy_all

# Seed 10 Studios
puts "Created Studios"
thirty_female_emails = [
  'Roselyn@wagon.com', 'Peyton@wagon.com', 'Alice@wagon.com', 'Aleah@wagon.com','Marilyn@gmail.com',
  'Madison@gmail.com', 'Elaine@gmail.com', 'Kenya@gmail.com', 'Lillian@gmail.com', 'Tamara@gmail.com',
  'Liliana@yahoo.com', 'Katherine@yahoo.com', 'Celeste@yahoo.com', 'Paisley@yahoo.com', 'Eleanor@yahoo.com',
  'Daphne@hotmail.com', 'Nina@hotmail.com', 'Anika@hotmail.com', 'Shayla@hotmail.com', 'Giada@hotmail.com', 'Ayla@hotmail.com',
  'Karsyn@me.com', 'Ellie@me.com', 'Dylan@me.com', 'Lea@me.com', 'Danika@me.com', 'Jillian@hello.me',
  'Samara@hello.me', 'Ireland@hello.me', 'Kaitlynn@hello.me'
]

thirty_male_emails = [
  'Demetrius@wagon.com', 'Dominique@wagon.com', 'Zachariah@wagon.com', 'Liam@wagon.com', 'Keshawn@wagon.com',
  'Keon@wagon.com', 'Trevin@wagon.com', 'Vaughn@gmail.com', 'Rhys@gmail.com', 'Alexzander@gmail.com', 'Martin@gmail.com',
  'Van@gmail.com', 'Javier@gmail.com', 'Jovanni@yahoo.com', 'Carlos@yahoo.com', 'Layne@yahoo.com',
  'Titus@yahoo.com', 'Talon@yahoo.com', 'Rex@yahoo.com', 'Jaiden@mail.me', 'Kash@wagon.com', 'Zachery@wagon.com',
  'Marvin@wagon.com', 'Cordell@wagon.com', 'Dario@wagon.com', 'Jake@gmail.com', 'Erik@gmail.com', 'Kole@gmail.com',
  'Donovan@gmail.com', 'Steven@gmail.com'
]

thirty_random_female_names = [
  'Roselyn', 'Peyton', 'Alice', 'Aleah','Marilyn',
  'Madison', 'Elaine', 'Kenya', 'Lillian', 'Tamara',
  'Liliana', 'Katherine', 'Celeste', 'Paisley', 'Eleanor',
  'Daphne', 'Nina', 'Anika', 'Shayla', 'Giada', 'Ayla',
  'Karsyn', 'Ellie', 'Dylan', 'Lea', 'Danika', 'Jillian',
  'Samara', 'Ireland', 'Kaitlynn'
]

thirty_random_male_names = [
  'Demetrius', 'Dominique', 'Zachariah', 'Liam', 'Keshawn',
  'Keon', 'Trevin', 'Vaughn', 'Rhys', 'Alexzander', 'Martin',
  'Van', 'Javier', 'Jovanni', 'Carlos', 'Layne', 'Titus',
  'Talon', 'Rex', 'Jaiden', 'Kash', 'Zachery', 'Marvin',
  'Cordell', 'Dario', 'Jake', 'Erik', 'Kole', 'Donovan', 'Steven'
]

twenty_cld_id_men = [
  'men/random_zrfkdi', 'men/random_chbygh', 'men/random_chbygh', 'men/random_ffvhsk',
  'men/random_l3j3ql', 'men/random_ocybor', 'men/random_opivew', 'men/random_qtfwpm',
  'men/random_rj3gwq', 'men/random_sfen6u', 'men/random_sgrdql', 'men/random_t8evfw',
  'men/random_tcc328', 'men/random_tptur9', 'men/random_tupenp', 'men/random_u3rnej',
  'men/random_w6niot', 'men/random_wlsf9g', 'men/random_wpbgdo', 'men/random_xltpjl'
]

twenty_cld_id_women = [
  'women/random_ltuw8r', 'women/random_rq9xbu', 'women/random_sasarw', 'women/random_si84sh',
  'women/random_u2d7lv', 'women/random_w5tmcr', 'women/random_wnztaq', 'women/random_zzl4wh',
  'women/random_rq9xbu', 'women/random_poo84f', 'women/random_ltuw8r', 'women/random_ijmrbw',
  'women/random_h9j7lr', 'women/random_gx2ffw', 'women/random_fpehkn', 'women/random_cuxthj',
  'women/random_jc2nu7', 'women/random_eagdej', 'women/random_ilnlij',' women/random_u1otnj',
]

ten_cld_id_male_instructors = [
  'male_instructors/thomastadlock', 'male_instructors/_20', 'male_instructors/YOGA-MEN222-crop',
  'male_instructors/YOGA-MEN221', 'male_instructors/images', 'male_instructors/article-2533788-1A6B39AD00000578-253_634x604',
  'male_instructors/yoga-instructors-feature_1800x1236', 'male_instructors/albert6',
  'male_instructors/a74f54dc5998d2f485d681ba85a4fa73--yoga-om-do-yoga', 'male_instructors/Yogi1-e1314031338497'
]

ten_cld_id_female_instructors = [
  "jessi-kneeland-700x700_0_eeibxn",
  "84e695eaaac4a3cc9d6ed9180c8d7e5c--female-personal-trainer-motivational-pics_l3tmwl",
  'instructors_female/UK-Maersk-Training-Appoints-First-Female-Instructor-300x160_lp6o',
  'instructors_female/64f03039e6818ee5287881e23bb0a920_gqsscp', 'instructors_female/Cross-legged_sitting_2C_female_indxk6',
  'instructors_female/yoga-1284657_960_720_xn2dmw', 'instructors_female/170309-F-AG923-0096_raupcg', 'instructors_female/170401-F-EC705-001_zliof7',
  'instructors_female/yoga-2607013_960_720_exwntt', 'instructors_female/girl-1211435_960_720_cl9p8j'
]

instructors_motivations = [
  "I don't tell you that it will be easy, I tell you that it will be worth it! – Hard work always pays off.",
  "Actions speak louder than words!", "Who only does what he already knows will always stay where he is. – The secret of success is to begin.",
  "We will create the best version of yourself together!", "IF YOU HAVE A BODY, YOU ARE AN ATHLETE.", "The sky is the limit. You can do anything you set your mind to.",
  "How bad do you want it?", "If it doesn’t challenge you, it doesn’t change you.","Do today what your future self will thank you for.",
  "Only those who know their goal will find the path. I will help you with that.", "If you’re not in love with your Body, let me help you.", "Be the person you’d like to meet",
  "You have to take personal responsibility, you can not change the circumstances, the seasons or the wind, but you can change yourself physically and mentally. You have it.",
  "You don't work out anywhere, so don't work out with anyone.", "Be stronger than your excuses", "Let's make the work out fun!", "Winners are not born, they are made.",
  "Together we will reach your dream body and give you more confidence", "Change only comes through change. Let's start with the change now!", "Never surrender. Never give up. Never back down."
]

instructors_areas = [
  "Diet", "Own body-weight workout", "Crossfit", "Yoga", "Flexibility", "Weight loss", "Health oriented training", "Functional training", "Muscle building",
  "Body shaping", "Body building", "Back strength", "Improvement of the posture", "Rehabilitation Training", "Endobalance (female hormone metabolism, detox)",
  "Lifestyle coaching", "Dynamic Joint Mobility-Training", "Outdoor workouts", "Preventive Back-strengthening exercise"
]

# 10 Female instructors
female_instructors=[]
(20..30).to_a.each do |index|
  area_array = instructors_areas.sample((2..5).to_a.sample)
  u = Instructor.new(first_name: thirty_random_female_names[index], last_name: Faker::Name.last_name, age: rand(20..40), description: instructors_motivations[index - 20], area: area_array )
  u.cld_id = ten_cld_id_female_instructors[index - 20]
  u.save
  female_instructors << u
end

# 10 Male instructors
male_instructors=[]
(20..30).to_a.each do |index|
  area_array = instructors_areas.sample((2..5).to_a.sample)
  u = Instructor.new(first_name: thirty_random_male_names[index], last_name: Faker::Name.last_name, age: rand(20..40), area: area_array )
  u.cld_id = ten_cld_id_male_instructors[index - 20]
  u.save
  male_instructors << u
end

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
  s = Studio.new(name: st_name, description: Faker::Lorem.paragraph, address: st_info[:address], telephone: st_info[:telephone], cld_id: st_info[:cld_id], distance: st_info[:distance])
  s.save
end

Studio.all.each_with_index do |s,i|
  female_instructors[i].update(studio: s)
  male_instructors[i].update(studio: s)
end
# Seed Users that DON'T belong to studios (regular customers)
puts "Created Users"


# 30 Female users
(0..20).to_a.each do |index|
  u = User.new(first_name: thirty_random_female_names[index], last_name: Faker::Name.last_name, email: thirty_female_emails[index], password: '123456', password_confirmation: '123456', role: 'customer')
  u.cld_id = twenty_cld_id_women[index]
  u.save
end

# 30 Male users
(0..20).to_a.each do |index|
  u = User.new(first_name: thirty_random_male_names[index], last_name: Faker::Name.last_name, email: thirty_male_emails[index], password: '123456', password_confirmation: '123456', role: 'customer')
  u.cld_id = twenty_cld_id_men[index]
  u.save
end

# Some users without names
10.times do
  User.create(email: Faker::Internet.email, password: '123456', password_confirmation: '123456')
end



demo_user = User.create(first_name: "Kris", last_name: "Espinosa", email: "demo@wagon.com", password: '123456', password_confirmation: '123456')

puts "Created Courses. To get correct course dates, make sure to seed before demo"
course_hash = {
  "New life Yoga" => { category: "Yoga", description: "This course is comprised of six series of asana, each of which has a specific function in cleansing and strengthening the mind and body." },
  "Yoga with Alvaro" => { category: "Yoga", description: "This course is comprised of six series of asana, each of which has a specific function in cleansing and strengthening the mind and body." },
  "Body and Mind"  => { category: "Yoga", description: "This course is comprised of six series of asana, each of which has a specific function in cleansing and strengthening the mind and body." },
  "Learn Pole Dancing" => { category: "Dance", description: "You will increase your upper body strength and improve your cardio with each move, plus learn the true Diva routine containing 15 new moves." },
  "Crossfit for life" => { category: "Crossfit", description: "Crossfit is appropriate for all populations looking to create a more robust and efficient aerobic system. " },
  "Adaptive Training" => { category: "Crossfit", description: "Crossfit is appropriate for all populations looking to create a more robust and efficient aerobic system. " },
  "Competitors" => { category: "Crossfit", description: "Crossfit is appropriate for all populations looking to create a more robust and efficient aerobic system. " },
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
  cour = Course.new(title: title, category: info[:category], start_time: st, end_time: st + random_length.sample.hours, price: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: info[:description], level: course_levels.sample)
  cour.studio = Studio.all.sample
  cour.instructor = cour.studio.instructors.sample
  cour.save
end

# tomorrow
(3..5).to_a.sample.times do
  course_hash.each do |title, info|
    st = random_today.sample + 1.day
    cour = Course.new(title: title, category: info[:category], start_time: st, end_time: st + random_length.sample.hours, price: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: info[:description], level: course_levels.sample)
    cour.studio = Studio.all.sample
    cour.instructor = cour.studio.instructors.sample
    cour.save
  end
end

# next 7 days
course_hash.each do |title, info|
  st = random_today.sample + (2..7).to_a.sample.day
  cour = Course.new(title: title, category: info[:category], start_time: st, end_time: st + random_length.sample.hours, price: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: info[:description], level: course_levels.sample)
  cour.studio = Studio.all.sample
  cour.instructor = cour.studio.instructors.sample
  cour.save
end

# old courses
course_hash.each do |title, info|
  st = random_today.sample - (1..7).to_a.sample.day
  cour = Course.new(title: title, category: info[:category], start_time: st, end_time: st + random_length.sample.hours, price: (7..15).to_a.sample, spots: (4..10).to_a.sample, description: info[:description], level: course_levels.sample)
  cour.studio = Studio.all.sample
  cour.instructor = cour.studio.instructors.sample
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
      "Perfect intensity, price, everything!", "Best instructor ever", "This was great",
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
