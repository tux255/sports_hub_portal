require 'faker'

FactoryBot.define do
  factory :survey do
    question { Faker::Lorem.question(word_count: 2) }
    start_date { Date.today }
    end_date { Date.tomorrow }

    before(:build, :create) do |record, _evaluator|
      record.survey_answers = {
        1 => FactoryBot.build(:survey_answer, survey: record),
        2 => FactoryBot.build(:survey_answer, survey: record)
      }
    end
  end
end

FactoryBot.define do
  factory :survey_answer do
    answer { Faker::Lorem.sentence(word_count: 2) }

    trait :with_empty_line do
      answer { '' }
    end

    association :survey, factory: :survey
  end
end
