FactoryBot.define do
  factory :profile do
    height       {175}
    weight       {70}
    fat_rate     {19.5}
    association :user
  end
end
