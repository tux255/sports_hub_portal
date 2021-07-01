# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence(word_count: 4) }
    content { Faker::Lorem.sentence(word_count: 50) }

    trait :with_image do
      image do
        fixture_file_upload('test-600x400.png', 'image/png')
      end
    end
  end
end
