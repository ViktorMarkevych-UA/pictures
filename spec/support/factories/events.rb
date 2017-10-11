FactoryGirl.define do
  factory :events do
    sequence(:eventtable_type)  { "User" }
    sequence(:eventtable_id) { |n| n }
    sequence(:user_id) { |n| n }
    sequence(:eventtable_body) { |n| "some text#{n}"}
  end
end