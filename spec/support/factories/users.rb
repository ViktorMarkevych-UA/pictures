FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@example.com"}
    password "password"
    password_confirmation { |n| n.password }

    #association :event
    #association :picture
    #association :event
    #association :comment
  end
end