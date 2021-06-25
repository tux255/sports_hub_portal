# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'aqwe123' }

    trait :admin do
      role { :admin }
    end

    trait :user do
      role { :user }
    end
  end
end
