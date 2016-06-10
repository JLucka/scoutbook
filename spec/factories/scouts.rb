FactoryGirl.define do
  factory :scout do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    pesel '01234567899'
    rank :och
    position 'Szeregowa'
    patrol
  end
  factory :leader_scout, class: "Scout" do
    association :scoutable, factory: :leader
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    pesel '01234567899'
  end
end
