# frozen_string_literal: true
require 'faker'

FactoryBot.define do
  factory :survey_answer do
    answer { Faker::Lorem.sentence(word_count: 2) }

    trait :with_empty_line do
      answer { '' }
    end

    association :survey, factory: :survey
  end
end
