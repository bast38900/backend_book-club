require 'faker'

# Seeding users to the database
User.destroy_all

3.times do |i|
  User.create(
    email: "user#{i + 1}@gmail.com",
    password: "password"
  )
end

p "Created #{User.count} users"

# Seeding books to the database
Book.destroy_all

10.times do
  Book.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    author: Faker::Name.name)
end

p "Created #{Book.count} books"
