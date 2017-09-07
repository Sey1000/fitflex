require 'faker'

puts "Start seeding.."

# First clear database
Favorite.destroy_all
Review.destroy_all
Booking.destroy_all
User.destroy_all
Course.destroy_all
Area.destroy_all
Instructor.destroy_all
Studio.destroy_all

# Seed order (!!IMPORTANT!!)
# 1. Studios
# 2. Instructors
# 3. Areas
# 4. Courses
# 5. Users
# 6. Bookings
# 7. Reviews
# 8. Favorites

# TODO: Demo preparation

# 1. Studios ===========================================================================================

studio_hash = {
  "Bodystreet" => { address: "Charlottenstr. 79, 10117 Berlin", telephone: "030 33846280", cld_id: "jnmth8rsvmvcbhi0hokx", distance: 0.2 },
  "Fitbox" => { address: "Rudi-Dutschke-Straße 1, 10969 Berlin", telephone: "030 98322747", cld_id: "hzgzwqyvcjxocjxrty4v", distance: 0.4 },
  "Urban Gladiator" => { address: "Wilhelmstraße 14, 10963 Berlin", telephone: "0176 55131262", cld_id: "sloh6uufvv8tvyqa8jwf", distance: 0.9 },
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

demo_studio = Studio.new(name: "Medical Fitness Academy", description: Faker::Lorem.paragraph, address: "Kleiststraße 3-6, 10787 Berlin", telephone: "030 21913071", cld_id: "goat yoga photo 21_2520January_2520Goat_2520Yoga_2520Kristen_2520Carter_2520Photography_xf548", distance: 4.0)

puts "Created Studios"

# 2. Instructors =======================================================================================

ten_female_instructor_first_names = [
  'Ayla', 'Karsyn', 'Ellie', 'Dylan', 'Lea',
  'Danika', 'Jillian', 'Samara', 'Ireland', 'Kaitlynn'
]

ten_male_instructor_first_names = [
  'Kash', 'Zachery', 'Marvin', 'Cordell', 'Dario',
  'Jake', 'Erik', 'Kole', 'Donovan', 'Steven'
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

ten_cld_id_female_instructors = [
  "jessi-kneeland-700x700_0_eeibxn",
  "84e695eaaac4a3cc9d6ed9180c8d7e5c--female-personal-trainer-motivational-pics_l3tmwl",
  'instructors_female/UK-Maersk-Training-Appoints-First-Female-Instructor-300x160_lp6o',
  'instructors_female/64f03039e6818ee5287881e23bb0a920_gqsscp', 'instructors_female/Cross-legged_sitting_2C_female_indxk6',
  'instructors_female/yoga-1284657_960_720_xn2dmw', 'instructors_female/170309-F-AG923-0096_raupcg', 'instructors_female/170401-F-EC705-001_zliof7',
  'instructors_female/yoga-2607013_960_720_exwntt', 'instructors_female/girl-1211435_960_720_cl9p8j'
]

ten_cld_id_male_instructors = [
  'male_instructors/thomastadlock', 'male_instructors/_20', 'male_instructors/YOGA-MEN222-crop',
  'male_instructors/YOGA-MEN221', 'male_instructors/images', 'male_instructors/article-2533788-1A6B39AD00000578-253_634x604',
  'male_instructors/yoga-instructors-feature_1800x1236', 'male_instructors/albert6',
  'male_instructors/a74f54dc5998d2f485d681ba85a4fa73--yoga-om-do-yoga', 'male_instructors/Yogi1-e1314031338497'
]

# 10 female instructors
(0..9).to_a.each do |ind|
  u = Instructor.new(first_name: ten_female_instructor_first_names[ind], last_name: Faker::Name.last_name, age: rand(20..40), description: instructors_motivations[ind])
  u.cld_id = ten_cld_id_female_instructors[ind]
  u.studio = Studio.all[ind]
  u.save
end

#10 male instructors
(0..9).to_a.each do |ind|
  u = Instructor.new(first_name: ten_male_instructor_first_names[ind], last_name: Faker::Name.last_name, age: rand(20..40), description: instructors_motivations[ind + 10])
  u.cld_id = ten_cld_id_male_instructors[ind]
  u.studio = Studio.all[ind]
  u.save
end

puts "Created Instructors"

# 3. Areas =============================================================================================

instructors_areas = [
  "Diet", "Own body-weight workout", "Crossfit", "Yoga", "Flexibility", "Weight loss", "Health oriented training", "Functional training", "Muscle building",
  "Body shaping", "Body building", "Back strength", "Improvement of the posture", "Rehabilitation Training", "Endobalance (female hormone metabolism, detox)",
  "Lifestyle coaching", "Dynamic Joint Mobility-Training", "Outdoor workouts", "Preventive Back-strengthening exercise"
]

Instructor.all.each do |each_inst|
  my_areas = instructors_areas.sample(3)
  my_areas.each do |area_name|
    a = Area.new(name: area_name)
    a.instructor = each_inst
    a.save
  end
end

# Access by calling instructor.areas (returns array)

puts "Created Areas"

# 4. Courses ==========================================================================================

course_hash = {
  "New life Yoga" => { category: "Yoga", description: "This course is comprised of six series of asana, each of which has a specific function in cleansing and strengthening the mind and body." },
  "Learn Pole Dancing" => { category: "Dance", description: "You will increase your upper body strength and improve your cardio with each move, plus learn the true Diva routine containing 15 new moves." },
  "Crossfit for life" => { category: "Crossfit", description: "Crossfit is appropriate for all populations looking to create a more robust and efficient aerobic system. " },
  "Competitors" => { category: "Crossfit", description: "Crossfit is appropriate for all populations looking to create a more robust and efficient aerobic system. " },
  "Zumba" => { category: "Dance", description: "Learn how to blend specific Zumba moves and body sculpting techniques using maraca-like Zumba Toning Sticks for an intense strength-training experience." },
  "Body and Mind"  => { category: "Yoga", description: "This course is comprised of six series of asana, each of which has a specific function in cleansing and strengthening the mind and body." },
  "Creative Pilates" => { category: "Pilates", description: "High-energy and dynamic class which integrates elements of Pilates, Dance, cardio, strength training and stretching. No dance experience required!" },
  "Kickboxing for winners" => { category: "Kickboxing", description: "Come ready to sweat like crazy, build a rock solid core, and burn hundreds of calories." },
  "Adaptive Training" => { category: "Crossfit", description: "Crossfit is appropriate for all populations looking to create a more robust and efficient aerobic system. " },
  "Traditional Taekwondo" => { category: "Martial Arts", description: "Taekwondo emphasizes a sense of morality, humility, and a respect for one's opponent. Practitioners can improve both their physical ability and mental strength." },
  "Goat Yoga" => { category: "Yoga", description: "This course is comprised of six series of asana, each of which has a specific function in cleansing and strengthening the mind and body." },
  "Interval Training" => { category: "HIIT", description: "HIIT is extremely popular because it provides both strength training and the calorie burning that comes with a cardio workout in intensely short sessions." }
}

course_levels = ["Beginner", "Intermediate", "Advanced"]

t = Time.now.beginning_of_day
random_today = [t + (8..15).to_a.sample.hour, t + (19..21).to_a.sample.hour]
random_length = [1, 1, 1, 1, 1.5, 1.5, 2]

# today
course_hash.each do |title, info|
  st = random_today.sample
  cour = Course.new(title: title, category: info[:category], start_time: st, end_time: st + random_length.sample.hours, price: [6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 10, 11, 12, 13, 15, 17, 20].sample, spots: (4..10).to_a.sample, description: info[:description], level: course_levels.sample)
  cour.studio = Studio.all.sample
  cour.instructor = cour.studio.instructors.sample
  cour.save
end

# tomorrow

3.times do
  course_hash.each do |title, info|
    st = random_today.sample + 1.day
    cour = Course.new(title: title, category: info[:category], start_time: st, end_time: st + random_length.sample.hours, price: [6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 10, 11, 12, 13, 15, 17, 20].sample, spots: (4..10).to_a.sample, description: info[:description], level: course_levels.sample)
    cour.studio = Studio.all.sample
    cour.instructor = cour.studio.instructors.sample
    cour.save
  end
end

# next 7 days
3.times do
  course_hash.each do |title, info|
    st = random_today.sample + (2..7).to_a.sample.day
    cour = Course.new(title: title, category: info[:category], start_time: st, end_time: st + random_length.sample.hours, price: [6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 10, 11, 12, 13, 15, 17, 20].sample, spots: (4..10).to_a.sample, description: info[:description], level: course_levels.sample)
    cour.studio = Studio.all.sample
    cour.instructor = cour.studio.instructors.sample
    cour.save
  end
end

# morning goat yoga course tomorrow: for demo
demo_goat_start_time = Time.now.beginning_of_day + 1.day + 8.hours
demo_goat_course = Course.new(title: "Goat Yoga", category: "Yoga")
demo_goat_course.start_time = demo_goat_start_time
demo_goat_course.end_time = demo_goat_start_time + 1.hour
demo_goat_course.price = 13
demo_goat_course.spots = 10
demo_goat_course.description = "Breath-taking, smile-inducing fitness trend sweeping the world since 2016 where you do a standard yoga class with adorable goats."
demo_goat_course.level = "Intermediate"
demo_goat_course.studio = demo_studio
demo_goat_course.instructor = demo_goat_course.studio.instructors.sample
demo_goat_course.save

puts "Created Courses"

# 5. Users ===========================================================================================

# 20 female users
twenty_user_female_names = [
  'Roselyn', 'Peyton', 'Alice', 'Aleah','Marilyn',
  'Madison', 'Elaine', 'Kenya', 'Lillian', 'Tamara',
  'Liliana', 'Katherine', 'Celeste', 'Paisley', 'Eleanor',
  'Daphne', 'Nina', 'Anika', 'Shayla', 'Giada'
]

twenty_female_emails = [
  'Roselyn@wagon.com', 'Peyton@wagon.com', 'Alice@wagon.com', 'Aleah@wagon.com','Marilyn@gmail.com',
  'Madison@gmail.com', 'Elaine@gmail.com', 'Kenya@gmail.com', 'Lillian@gmail.com', 'Tamara@gmail.com',
  'Liliana@yahoo.com', 'Katherine@yahoo.com', 'Celeste@yahoo.com', 'Paisley@yahoo.com', 'Eleanor@yahoo.com',
  'Daphne@hotmail.com', 'Nina@hotmail.com', 'Anika@hotmail.com', 'Shayla@hotmail.com', 'Giada@hotmail.com'
]

twenty_cld_id_women = [
  'women/random_ltuw8r', 'women/random_rq9xbu', 'women/random_sasarw', 'women/random_si84sh',
  'women/random_u2d7lv', 'women/random_w5tmcr', 'women/random_wnztaq', 'women/random_zzl4wh',
  'women/random_rq9xbu', 'women/random_poo84f', 'women/random_ltuw8r', 'women/random_ijmrbw',
  'women/random_h9j7lr', 'women/random_gx2ffw', 'women/random_fpehkn', 'women/random_cuxthj',
  'women/random_jc2nu7', 'women/random_eagdej', 'women/random_ilnlij',' women/random_cuxthj',
]

(0..19).to_a.each do |ind|
  u = User.new(first_name: twenty_user_female_names[ind], last_name: Faker::Name.last_name, email: twenty_female_emails[ind], password: '123456', password_confirmation: '123456', role: 'customer')
  u.cld_id = twenty_cld_id_women[ind]
  u.save
end

# 20 male users
twenty_user_male_names = [
  'Demetrius', 'Dominique', 'Zachariah', 'Liam', 'Keshawn',
  'Keon', 'Trevin', 'Vaughn', 'Rhys', 'Alexzander',
  'Martin', 'Van', 'Javier', 'Jovanni', 'Carlos',
  'Layne', 'Titus', 'Talon', 'Rex', 'Jaiden'
]

twenty_male_emails = [
  'Demetrius@wagon.com', 'Dominique@wagon.com', 'Zachariah@wagon.com', 'Liam@wagon.com', 'Keshawn@wagon.com',
  'Keon@wagon.com', 'Trevin@wagon.com', 'Vaughn@gmail.com', 'Rhys@gmail.com', 'Alexzander@gmail.com',
  'Martin@gmail.com', 'Van@gmail.com', 'Javier@gmail.com', 'Jovanni@yahoo.com', 'Carlos@yahoo.com',
  'Layne@yahoo.com', 'Titus@yahoo.com', 'Talon@yahoo.com', 'Rex@yahoo.com', 'Jaiden@mail.me',
]

twenty_cld_id_men = [
  'men/random_zrfkdi', 'men/random_chbygh', 'men/random_chbygh', 'men/random_ffvhsk',
  'men/random_l3j3ql', 'men/random_ocybor', 'men/random_opivew', 'men/random_qtfwpm',
  'men/random_rj3gwq', 'men/random_sfen6u', 'men/random_sgrdql', 'men/random_t8evfw',
  'men/random_tcc328', 'men/random_tptur9', 'men/random_tupenp', 'men/random_u3rnej',
  'men/random_w6niot', 'men/random_wlsf9g', 'men/random_wpbgdo', 'men/random_xltpjl'
]

(0..19).to_a.each do |ind|
  u = User.new(first_name: twenty_user_male_names[ind], last_name: Faker::Name.last_name, email: twenty_male_emails[ind], password: '123456', password_confirmation: '123456', role: 'customer')
  u.cld_id = twenty_cld_id_men[ind]
  u.save
end

# TODO: create demo user and assign bookings

# demo_user = User.create(first_name: "Kris", last_name: "Espinosa", email: "demo@wagon.com", password: '123456', password_confirmation: '123456')

puts "Created Users, still need to create demo user"

# 6. Bookings ==========================================================================================

puts "Need to create demo bookings"


# 7. Reiviews ==========================================================================================

review_titles = [
  ["Too easy for me", "Okay", "Not bad", "I'll try again next time", "Studio was nice"],
  ["Too easy for me", "Too difficult for me", "This was great", "Awesome",
    "Would do it again", "Good deal!", "Loved it!!", "Bit too far away",
    "Please bring this course to Frankfurt", "Amazing studio", "Amazing instructor"],
  ["Best course ever", "You should definitely do this course!",
    "Perfect intensity, price, everything!", "Best instructor ever", "This was great",
    "Awesome", "Would do it again", "Good deal!", "Loved it!!",
    "Please bring this course to Frankfurt", "Best in Berlin", "I feel very good after this course", "Refreshing"]
]

Course.all.each do |cs|
  (3..5).to_a.sample.times do
    ind = (0..2).to_a.sample
    r = Review.new(title: review_titles[ind].sample, content: Faker::HowIMetYourMother.quote, rating: ind + 3)
    r.course = cs
    r.user = User.all.sample
    r.save
  end
end

100.times do
  ind = (0..2).to_a.sample
  r = Review.new(title: review_titles[ind].sample, content: Faker::HowIMetYourMother.quote, rating: ind + 3)
  r.course = Course.all.sample
  r.user = User.all.sample
  r.save
end

puts "Created reviews"

# 8. Favorites =========================================================================================



puts "Seeding complete"
