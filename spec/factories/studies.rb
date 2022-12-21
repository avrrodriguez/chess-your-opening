FactoryBot.define do
  factory :study do
    user_id { 1 }
    opening_id { 1 }
    notes { Faker::Quotes::Shakespeare.hamlet_quote }
    public { true }

    trait :hidden do
      public { false }
    end
  end
end
