# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'

User.create(name: 'Administrator', password: 'aqwe123', email: 'tux255@gmail.com', role: 'admin')
puts 'CREATED ADMIN USER'

3.times do
  user_name = Faker::Name.name
  user_email = Faker::Internet.email
  u = User.create!(name: user_name, password: 'aqwe123', email: user_email, role: 'user')

  4.times do |category_index|
    c = Category.create(
      title: "Category #{category_index}",
      user_id: u.id
    )

    2.times do |subcategory_index|
      sc = Category.create(
        title: "Subcategory #{subcategory_index}",
        user_id: u.id,
        parent_id: c.id
      )

      rand(3...5).times do |subcat_post_index|
        Post.create(
          title: "Post #{subcat_post_index} #{subcategory_index} #{category_index}",
          content: Faker::Lorem.sentence(word_count: 10),
          published: [true, false].sample,
          category_id: sc.id,
          user_id: u.id
        )
      end
    end

    rand(3...5).times do |cat_post_index|
      Post.create(
        title: "Post #{cat_post_index} #{category_index}",
        content: Faker::Lorem.sentence(word_count: 10),
        published: [true, false].sample,
        category_id: c.id,
        user_id: u.id
      )
    end
  end

  rand(2...5).times do |surv_index|
    Survey.create!(
      question: "Question #{surv_index}",
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
