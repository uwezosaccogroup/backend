puts "Seeding...🪴🪴"

user1 = User.create(name: "John", email: "john@example.com", phone: "555-1234", location: "New York")
user2 = User.create(name: "Jane", email: "jane@example.com", phone: "555-5678", location: "Los Angeles")
user3 = User.create(name: "Jony", email: "jony@example.com", phone: "555-1765", location: "Nairobi")
user4 = User.create(name: "Tony", email: "tony@example.com", phone: "555-9084", location: "Machakos")


# Create an account for user1
Account.create(account_number: "12345678", date_of_transaction: "2022-01-01", balance: "1000", user_id: user1.id)

# Create a loan for user2
Loan.create(loan_amount: "5000", interest_rate: "3.5", loan_term: "2 years", user_id: user2.id)

puts "Done seeding🌵"

