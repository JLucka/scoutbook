FactoryGirl.define do
  factory :leader do
    leader_rank 1
    phone Faker::PhoneNumber.phone_number
    troop
    association :scout, factory: :scout
  end
end
