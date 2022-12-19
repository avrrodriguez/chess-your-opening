FactoryBot.define do
  factory :opening do
    name { Faker::Name.first_name }
    description { Faker::Quotes::Shakespeare.hamlet_quote }
    difficulty { "Beginner" }
    variation { Faker::Alphanumeric.alphanumeric(number: 10) }
  end
end
