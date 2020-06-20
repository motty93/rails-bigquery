FactoryBot.define do
  factory :user do
    locale { 1 }
    role_type { 1 }
    name { "MyString" }
    age { 1 }
    email { "MyString" }
  end
end
