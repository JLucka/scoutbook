FactoryGirl.define do
  factory :badge do
    name "Higienistka"
    stars 0
    scout
    opened_at Date.yesterday
    trait :closed do
      closed_at Date.today
    end
  end
end
