FactoryBot.define do
  factory :schedule do
    user { build(:user) }
    bike { build(:bike) }
    start_at { DateTime.now }
    end_at { DateTime.now + (rand * 10)}
  end
end
