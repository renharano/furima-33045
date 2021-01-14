FactoryBot.define do
  factory :frima do
    text {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    association :user 
  end
end
