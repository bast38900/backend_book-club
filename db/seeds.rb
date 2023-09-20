# Seeding users to the database
User.destroy_all

3.times do |i|
  User.create(
    email: "user#{i + 1}@gmail.com",
    password: "password"
  )
end

p "Created #{User.count} users"
