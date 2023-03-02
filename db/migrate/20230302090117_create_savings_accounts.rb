class CreateSavingsAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :savings_accounts do |t|
      t.string :user_id
      t.string :account_number
      t.string :date_of_transaction
      t.string :balance
    end
  end
end
