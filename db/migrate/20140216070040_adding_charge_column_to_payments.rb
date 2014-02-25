class AddingChargeColumnToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :charge_date, :date 
  end
end
