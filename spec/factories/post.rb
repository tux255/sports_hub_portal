require 'faker'

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence(word_count: 4) }
    body { Faker::Lorem.sentences(number: 5) }

    trait :with_no_body do
      body { '' }
    end

    trait :with_no_title do
      title { '' }
    end

    trait :with_no_body_and_title do
      title { '' }
      body { '' }
    end
  end
end
