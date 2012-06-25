FactoryGirl.define do
  factory :category do
    name 'This is a category'
    pictures { [association(:picture)] }
  end
end