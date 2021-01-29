FactoryBot.define do
  FactoryBot.define do
    factory :user do
      nickname              {Faker::Name.initials(number: 2)}
      email                 {Faker::Internet.free_email}
      password              {'a1'+ Faker::Internet.password(min_length: 6)}
      password_confirmation {password}
      first_name            { '田中' }
      last_name             { '太朗'}
      first_name_kana       { 'タナカ'}
      last_name_kana        { 'タロウ'}
      birth_day             {Faker::Date.birthday(min_age: 18, max_age: 65) }
    end
  end
end
