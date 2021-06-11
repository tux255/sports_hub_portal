FactoryBot.define do
  factory :admin, class: 'User' do
    name { 'Admin' }
    email { 'tux255@gmail.com' }
    role { 'admin' }
    password { 'aqwe123' }
  end
end
