# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'

User.create(name: 'Administrator', password: 'aqwe123', email: 'tux255@gmail.com', role: 'admin')
puts 'CREATED ADMIN USER'

3.times do |_index|
  user_name = Faker::Name.name
  user_email = Faker::Internet.email
  u = User.create!(name: user_name, password: 'aqwe123', email: user_email, role: 'admin')

  2.times do
    c = Category.create!(
      title: Faker::Lorem.sentence(word_count: 2),
      user_id: u.id
    )

    3.times do
      sc = Category.create!(
        title: Faker::Lorem.sentence(word_count: 2),
        user_id: u.id,
        parent_id: c.id
      )

      rand(3...5).times do
        Post.create(
          title: Faker::Lorem.sentence(word_count: 3),
          body: Faker::Lorem.sentence(word_count: 10),
          published: [true, false].sample,
          category_id: sc.id,
          user_id: u.id
        )
      end
    end

    rand(3...5).times do |_i|
      Post.create(
        title: Faker::Lorem.sentence(word_count: 3),
        body: Faker::Lorem.sentence(word_count: 10),
        published: [true, false].sample,
        category_id: c.id,
        user_id: u.id
      )
    end
  end

  rand(2...5).times do
    Survey.create!(
      question: Faker::Lorem.question(word_count: 2),
      start_date: Date.today,
      end_date: Date.tomorrow,
      survey_answers_attributes: {
        0 => { answer: Faker::Lorem.sentence(word_count: 1), votes: rand(500) },
        1 => { answer: Faker::Lorem.sentence(word_count: 1), votes: rand(100) }
      },
      user_id: u.id
    )
  end

  puts "CREATED USER #{user_email} WITH #{u.posts.count} ARTICLES AND #{u.categories.count} CATEGORIES AND #{u.surveys.count} SURVEYS"
end
