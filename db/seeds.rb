# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

10.times do |_index|
  user_name = Faker::Name.name
  user_email = Faker::Internet.email
  u = User.create(name: user_name, password: 'aqwe123', email: user_email)

  rand(10).times do
    u.articles.create(title: Faker::Lorem.sentence(word_count: 3), body: Faker::Lorem.sentences(number: 2))
  end

  puts "CREATED USER #{user_email} WITH #{u.articles.count} ARTICLES"
end
