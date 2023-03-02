class CreateCurrentAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :current_accounts do |t|
      t.string :user_id
      t.string :user_name
      t.string :account_number
      t.string :date_of_transaction
      t.string :balance
    end
  end
end
