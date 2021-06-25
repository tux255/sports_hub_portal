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

    trait :with_no_content do
      content { '' }
    end

    trait :with_no_title do
      title { '' }
    end

    trait :with_no_content_and_title do
      title { '' }
      content { '' }
    end
  end
end
