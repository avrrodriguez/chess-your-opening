FactoryBot.define do
  factory :user do
    email { "test@email.com" }
    password { "password" }
    admin { false }
  end

  trait :admin do
    admin { true }
  end
end
