class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :subscription_id
      t.string :cc_info
      t.decimal :amount
      t.datetime :charge_date

      t.timestamps
    end
  end
end
