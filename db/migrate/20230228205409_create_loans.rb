class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.string :user_id
      t.string :loan_amount
      t.string :interest_rate
      t.string :loan_term
    end
  end
end
