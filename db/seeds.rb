puts "Seeding...🪴🪴"

all_users = [
  { name: "John", email: "john@example.com", phone: "555-1234", location: "New York" },
  { name: "Jane", email: "jane@example.com", phone: "555-5678", location: "Los Angeles" },
  { name: "Jony", email: "jony@example.com", phone: "555-1765", location: "Nairobi" },
  { name: "Tony", email: "tony@example.com", phone: "555-9084", location: "Machakos" }
]

all_users.each do |all_users|
  user = User.create(all_users)
  CurrentAccount.create(user_id: user.id,account_number: "12345678", date_of_transaction: "2022-01-01", balance: "1000")
  SavingsAccount.create(user_id: user.id,account_number: "12345678", date_of_transaction: "2022-01-01", balance: "1000")
end

puts "Done seeding🌵"

