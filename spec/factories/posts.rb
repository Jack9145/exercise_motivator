FactoryBot.define do
  factory :post do
    title      {"ここにタイトルが入ります"}
    text       {"ここにテキストが入ります"}
    association :user
  end
end
