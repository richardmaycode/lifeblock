# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! email: "admin@test.com", password: "testing123"
User.create! email: "test@test.com", password: "testing123"
User.create! email: "test1@test.com", password: "testing123"
Account.create! role: 0, status: 0, owner: User.first
Account.create! role: 1, status: 0, owner: User.second
Account.create! role: 1, status: 0, owner: User.last
schemes = ["Pastel", "Monochromic"]
schemes.each do |scheme|
  ColorScheme.create! name: scheme
end

2.times do |i|  
MosaicSetting.create(color_scheme: ColorScheme.first, account: Account.find(i + 1))
end


start_date = (Date.today - 2.months).beginning_of_month
end_date = Date.today

(start_date..end_date).each do |date|
  Reflection.create! completed: date, mood: Reflection.moods.keys[rand(0..3)], account: Account.second, creator: User.first
end

