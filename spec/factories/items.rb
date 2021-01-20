FactoryBot.define do
  factory :item do
    name            {'車'}
    text            {'中古です'}
    category_id        {2}
    status_id          {2}
    judgment_id        {2}
    prefecture_id      {2}
    day_id             {2}
    price           {300}
    association:user  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
