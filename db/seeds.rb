# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'

User.create(name: 'Administrator', password: 'aqwe123', email: 'tux255@gmail.com', role: 'admin')
puts 'CREATED ADMIN USER'

3.times do |_index|
  user_name = Faker::Name.name
  user_email = Faker::Internet.email
  u = User.create(name: user_name, password: 'aqwe123', email: user_email)

  rand(10).times do
    u.posts.create(title: Faker::Lorem.sentence(word_count: 3), body: Faker::Lorem.sentence(word_count: 10),
                   published: [true, false].sample)
  end

  puts "CREATED USER #{user_email} WITH #{u.posts.count} ARTICLES"
end
