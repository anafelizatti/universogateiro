FactoryBot.define do
  factory :indication do
    category { "MyString" }
    name { "MyString" }
    description { "MyText" }
    price { 1.5 }
    link { "MyString" }
    user { nil }
  end
end
