FactoryBot.define do
  factory :picture do
    sequence(:pict_file_name) {|n| "name#{n}"}
    sequence(:pict_content_type) {|n| "content#{n}"}

    #association :category
  end
end