RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

# This will guess the User class
FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    admin { false }
  end
end
