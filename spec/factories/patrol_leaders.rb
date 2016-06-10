FactoryGirl.define do
  factory :patrol_leader do
    phone Faker::PhoneNumber.phone_number
    association :scout, factory: :scout
    patrol
  end
end
