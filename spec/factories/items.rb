FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    price { "9.99" }
    user { nil }
  end
end
