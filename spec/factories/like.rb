FactoryBot.define do
  factory :like do
  end

  factory :negative_like, parent: :like, class: 'NegativeLike'
  factory :positive_like, parent: :like, class: 'PositiveLike'
end
