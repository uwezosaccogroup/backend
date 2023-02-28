class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :location
      t.string :occupation
      t.string :next_of_kin
      t.string :next_of_kin_phone
      t.string :balance
    end
  end
end
