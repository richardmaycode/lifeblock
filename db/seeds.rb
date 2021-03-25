# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! email: "test@test.com", password: "testing123"
Account.create! role: 0, status: 0, owner: User.first

(Date.today.beginning_of_month..Date.today).each do |date|
  Reflection.create! completed: date, mood: Reflection.moods.keys[rand(0..3)], account: Account.first, creator: User.first
end
