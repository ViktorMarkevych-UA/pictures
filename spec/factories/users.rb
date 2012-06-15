FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@example.com"}
    sequence(:password) {|n| "password"}
    sequence(:password_confirmation) {|n| "password"}
    #sequence(:full_name) {|n| "Full#{n} Name#{n}"}
  end
end