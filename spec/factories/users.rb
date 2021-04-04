FactoryBot.define do
  factory :user, aliases: [:owner, :creator] do
    sequence :email do |e|  
      "user_#{e}@test.com"
    end
    password { "testing123" }
  end
end
