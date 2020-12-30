FactoryBot.define do
  factory :comment do
    text      {"テスト"}
    association :user
    association :post
  end
end
