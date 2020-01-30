  FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
  end

    factory(:country) do
      name { Faker::Address.country }
    end
  end
