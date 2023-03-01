User.create(name:Faker::Name.name,email:Faker::Internet.email,phonenumber:Faker::PhoneNumber.phonenumber)

Account.create(userid:User.last.id,accountnumber:Faker::Number.unique.number)

Loan.create(accountid:Account.last.id,loanterm:Faker::Number.between(1,10))