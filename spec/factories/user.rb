FactoryBot.define do
  factory :user do
    username { "Admin" }
    email { "example@example.com" }
    role { "admin" }
  end
end
