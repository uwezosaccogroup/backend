puts "Seeding...🪴🪴"

users_data = [  
    { 
        name: "John Snow",
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        location: Faker::Address.city,
        occupation: Faker::Job.title,
        next_of_kin: Faker::Name.name,
        next_of_kin_phone: Faker::PhoneNumber.phone_number,
        account_type:  "savings"
    },
    {
        name: "Tony Stark",
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        location: Faker::Address.city,
        occupation: Faker::Job.title,
        next_of_kin: Faker::Name.name,
        next_of_kin_phone: Faker::PhoneNumber.phone_number,
        account_type:  "current"
    },
    {
        name: "Hank Pimm",
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        location: Faker::Address.city,
        occupation: Faker::Job.title,
        next_of_kin: Faker::Name.name,
        next_of_kin_phone: Faker::PhoneNumber.phone_number,
        account_type:  "savings"
    },
    {
        name: "Adam Smasher",
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        location: Faker::Address.city,
        occupation: Faker::Job.title,
        next_of_kin: Faker::Name.name,
        next_of_kin_phone: Faker::PhoneNumber.phone_number,
        account_type: "current"
    }
]

users_data.each do |user_data|
  user = User.create(user_data)

  SavingsAccount.create(
    account_number: Faker::Number.number(digits: 8),
    date_of_transaction: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
    balance: "1000",
    user_id: user.id
  )

  CurrentAccount.create(
    account_number: Faker::Number.number(digits: 8),
    date_of_transaction: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
    balance: "1000",
    user_id: user.id
  )
end

puts "Done seeding🌵"

