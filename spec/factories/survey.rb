# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :survey do
    question { Faker::Lorem.question(word_count: 2) }
    start_date { Date.today }
    end_date { Date.tomorrow }
    survey_answers_attributes do
      [
        { answer: 'Yes' },
        { answer: 'No' }
      ]
    end

    trait :no_question do
      question { '' }
    end

    trait :no_answers do
      survey_answers_attributes { '' }
    end

    trait :one_answer do
      survey_answers_attributes do
        [
          { answer: 'Single answer' }
        ]
      end
    end

    trait :no_start_date do
      start_date { '' }
    end

    trait :start_date_in_past do
      start_date { Date.yesterday }
    end

    trait :no_end_date do
      end_date { '' }
    end
  end
end
