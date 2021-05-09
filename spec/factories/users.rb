FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@email.com.br" }
    password { '123456' }
  end
end