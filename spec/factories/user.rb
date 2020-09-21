FactoryBot.define do
  factory :user do
    password = Faker::Internet.password
    email {Faker::Internet.free_email}
    encrypted_password {password}
    Nickname {Faker::Name.name}
    First_name {Faker::Name.first_name}
    Family_name {Faker::Name.last_name}
    First_name_kana {Faker::Name.first_name}
    Family_name_kana {Faker::Name.last_name}
    Birth_year {Faker::Date.backward}
    Birth_day {Faker::Date.backward}
    Birth_month {Faker::Date.backward}
    password {password}
  end
end