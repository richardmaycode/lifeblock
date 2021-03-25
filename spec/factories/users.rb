FactoryBot.define do
  factory :user, aliases: [:owner] do
    email { "text@test.com" }
    password { "testing123" }
  end
end
