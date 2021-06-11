FactoryBot.define do
  factory :user do
    name { 'User' }
    email { 'example@mail.test' }
    role { 'user' }
    password { 'aqwe123' }
  end
end
