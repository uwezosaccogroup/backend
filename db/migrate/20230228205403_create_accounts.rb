class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.string :user_id
      t.string :date_of_transaction
      t.string :balance
    end
  end
end
