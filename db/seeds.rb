
10.times do 
    User.create(
       name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone,
         location:Faker::
         occupation:Faker::
         next_of_kin:Faker::
         next_of_kin_phone:Faker::
   )
end

accounts ={
    "user1":{:name =>"John Doe",:balance =>20000}
}
