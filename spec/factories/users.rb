FactoryBot.define do
  factory :user do
    teacher_name          {Faker::Name.initials(number: 4)}
    school_name           {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
