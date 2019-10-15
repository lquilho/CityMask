# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database"
Vote.destroy_all
FixpointAttachment.destroy_all
Fixpoint.destroy_all
User.destroy_all
User.destroy_all
Fixpoint.destroy_all
FixpointAttachment.destroy_all

puts 'Creating fake users...'

fermin = User.new(
  name: 'Admin' ,
  email: 'admin@gmail.com',
  password: "666666",
  admin: true
)
fermin.save!

10.times do
  user = User.new(
    name: Faker::Name.name ,
    email: Faker::Internet.email,
    password: "666666"
  )
  user.save!
end
puts "finished creating fake users"



puts "Creating fake fixpoints and fixpoint attachments"

fixpoint1 = Fixpoint.new(latitude: 38.71186305, longitude: -9.13277523, user: User.all.sample, category: 0, created_at: Date.today - 40)
fixpoint1.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/garbage1.jpg"))
fixpoint1.save!

fixpoint2 = Fixpoint.new(latitude: 38.7193042, longitude: -9.14054811, user: User.all.sample, category: 0,  created_at: Date.today - 60)
fixpoint2.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/garbage2.jpg"))
fixpoint2.save!

fixpoint3 = Fixpoint.new(latitude: 38.71337819, longitude: -9.12580578, user: User.all.sample, category: 0,  created_at: Date.today - 20)
fixpoint3.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/graffiti1.jpg"))
fixpoint3.save!

fixpoint4 = Fixpoint.new(latitude: 38.71084859, longitude: -9.13569299, user: User.all.sample, category: 1,  created_at: Date.today - 90)
fixpoint4.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/graffiti2.jpg"))
fixpoint4.save!

fixpoint5 = Fixpoint.new(latitude: 38.7135469, longitude: -9.1367033, user: User.all.sample, category: 1,  created_at: Date.today - 190)
fixpoint5.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/road1.jpg"))
fixpoint5.save!

fixpoint6 = Fixpoint.new(latitude: 38.71613696, longitude: -9.13561776, user: User.all.sample, category: 1,  created_at: Date.today - 150)
fixpoint6.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/road2.jpg"))
fixpoint6.save!

fixpoint7 = Fixpoint.new(latitude: 38.71183255, longitude: -9.13787767, user: User.all.sample, category: 2,  created_at: Date.today - 40)
fixpoint7.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/wall1.jpg"))
fixpoint7.save!

fixpoint8 = Fixpoint.new(latitude: 38.71324097, longitude: -9.14390172, user: User.all.sample, category: 2,  created_at: Date.today - 130)
fixpoint8.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/wall2.jpg"))
fixpoint8.save!

fixpoint9 = Fixpoint.new(latitude: 38.72148564, longitude: -9.13287789, user: User.all.sample, category: 3,  created_at: Date.today - 230)
fixpoint9.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/wires1.jpg"))
fixpoint9.save!

fixpoint10 = Fixpoint.new(latitude: 38.70930381, longitude: -9.13917608, user: User.all.sample, category: 3, created_at: Date.today - 155)
fixpoint10.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/wires2.jpg"))
fixpoint10.save!

fixpoint11 = Fixpoint.new(latitude: 38.748766, longitude: -9.148501, user: User.all.sample, category: 3, fixed: true,  created_at: Date.today - 300)
fixpoint11.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/gianthole.jpg"))
fixpoint11.fixpoint_attachments.build(photo: File.open("app/assets/images/photos/giantholefix.jpeg"))
fixpoint11.save!

User.all.each do |user|
  rand(50).times do
    fixpoint = Fixpoint.all.sample
    vote = Vote.new(user: user, fixpoint: fixpoint)
    if vote.valid?
      vote.save
    end
  end
end

puts "finishing creating fake fixpoints"

# puts "creating fake "
