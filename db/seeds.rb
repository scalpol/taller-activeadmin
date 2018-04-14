# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@admin.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# 10.times do |i|
#   User.create(email: "usuario#{i+1}@correo.com", password:'123456')
# end
Post.destroy_all
10.times do |i|
  Post.create(
    user: User.order("RANDOM()").first,
    title: Faker::LeagueOfLegends.quote,
    content: Faker::Lorem.paragraph)
end

20.times do |i|
  Comment.create(
    post: Post.order("RANDOM()").first,
    content: Faker::Lorem.paragraph)
end
