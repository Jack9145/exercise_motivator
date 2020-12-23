FactoryBot.define do
  factory :user do
      nickname              {"test"}
      email                 {"test@gmail.com"}
      password              {"aaa111"}
      password_confirmation {password}
  end
end
