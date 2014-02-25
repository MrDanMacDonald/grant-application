class AddingChargeDateToPayments < ActiveRecord::Migration
  def change
    add_column :subscriptions, :charge_date, :date 
  end
end
