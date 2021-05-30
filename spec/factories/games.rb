FactoryBot.define do
  factory :game do
    user
    practice_date   {2000-1-1}
    recruit_id      {2}
    place_id        {2}
    battle_level_id {2}
    comment         {Faker::Name.initials(number: 10)}
  end
end
