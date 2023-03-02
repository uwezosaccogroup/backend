class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string "name"
      t.string "phone"
      t.string "email"
      t.string "location"
      t.string "occupation"
      t.string "next_of_kin"
      t.string "next_of_kin_phone"
      t.string "account_type"
    end
  end
end
