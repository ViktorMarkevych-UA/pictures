FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@ukr.net" }
    password 'password'
    password_confirmation'password'
    first_name 'test'
    last_name 'test'
    confirmed_at  Time.now
  end
end
