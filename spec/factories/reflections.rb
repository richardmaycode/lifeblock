FactoryBot.define do
  factory :reflection do
    account
    creator
    mood { 0 }
    note { "This is a note about how I'm feeling"}
    completed { Time.zone.today }
  end
end
