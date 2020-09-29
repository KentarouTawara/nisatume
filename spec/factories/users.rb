FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "admin-#{n}" }
    sequence(:email){ |n| "test_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
