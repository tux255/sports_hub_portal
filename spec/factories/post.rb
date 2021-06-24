require 'faker'

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence(word_count: 4) }
    content { Faker::Lorem.sentence(word_count: 50) }

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
