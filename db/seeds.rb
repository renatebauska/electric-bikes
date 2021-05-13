User.destroy_all
User.create!(
  [
    {
      username: "Admin",
      email: "admin@example.com",
      password: "admin123",
      password_confirmation: "admin123",
      role: "admin"
    },
    {
      username: "User",
      email: "user@example.com",
      password: "admin123",
      password_confirmation: "admin123",
      role: "user"
    },
  ]
)

Bike.destroy_all
Bike.create!(
  [
    {
      name: "HIMO Z16 250W"
    },
    {
      name: "ROY 07"
    },
    {
      name: "TANDEMS"
    },
  ]
)
