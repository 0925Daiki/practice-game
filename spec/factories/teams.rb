FactoryBot.define do
  factory :team do
    user
    area_id        {2}
    member_id      {2}
    team_level_id  {2}
    profile        {Faker::Name.initials(number: 10)}
  end
end
